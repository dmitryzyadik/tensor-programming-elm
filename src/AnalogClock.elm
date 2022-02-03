module AnalogClock exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Browser
import Debug exposing (toString)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (..)


main = 
  Browser.element
      { init          = initModel
      , view          = view
      , update        = update
      , subscriptions = subscriptions
      }

type alias Model =      
  Time.Posix 

type Msg =
  Tick Posix 

initModel : () -> (Model, Cmd Msg)
initModel  _ = 
  ( (Time.millisToPosix 0) , Cmd.none )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (  newTime 
      , Cmd.none
      )

secondHand model =
  let
      angle = 
            
          turns <| (toFloat (Time.posixToMillis model )) /100000
      handX = 
         
        toString (50 + 40 *   cos angle)
      handY = 
        toString (50 + 40 * sin angle)
  in
    
    line [x1 "50", y1 "50", x2 handX, y2 handY, stroke "black"][]
minutHand model =
  let
      angle = 
            
          turns <| (toFloat (toMinute utc model ))/60
      handX = 
         
        toString (50 + 40 *   cos angle)
      handY = 
        toString (50 + 40 * sin angle)
  in
    
    line [x1 "50", y1 "50", x2 handX, y2 handY, stroke "blue"][]
hourHand model =
  let
      angle = 
            
          turns <| (toFloat (toHour utc model ))/24
      handX = 
         
        toString (50 + 30 *   cos angle)
      handY = 
        toString (50 + 30 * sin angle)
  in
    
    line [x1 "50", y1 "50", x2 handX, y2 handY, stroke "white"][]

toUtcString : Time.Posix -> String
toUtcString time =
  String.fromInt (toHour utc time)
  ++ ":" ++
  String.fromInt (toMinute utc time)
  ++ ":" ++
  String.fromInt (toSecond utc time)
  ++ " (UTC)"

view : Model -> Html msg
view model =
  div [][
  svg [viewBox "0 0 100 100", Svg.Attributes.width "300px"]
      [ circle [ cx "50", cy "50", r "45", Svg.Attributes.fill "red"] []
      , secondHand model
      , minutHand model
      , hourHand model      
  ] 

  , div [][ Html.text (toUtcString model)]
  ]
subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every 100 Tick
