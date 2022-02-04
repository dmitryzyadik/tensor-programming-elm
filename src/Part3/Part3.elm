module Part3.Part3 exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Browser
import Debug exposing (toString)
-- import Svg exposing (..)
-- import Svg.Attributes exposing (..)
import Time exposing (..)

main : Program () Model Msg
main = 
  Browser.sandbox
      {
        init = initModel
        , view = view
        , update = update
      }

view model =
  div [Html.Attributes.class "scoreboard"]
    [ stylesheet
      ,input [ type_ "text" 
            , onInput UpdateTodo
            , value model.todo
            ] []
      , button [class "pure-button", onClick AddTodo][ text "Применить"]
      , button [class "pure-button", onClick RemoveAll][ text "Удалить всё"]
      , todoList model.todos
    ]

type alias Model =
  {
    todo : String
    , todos : List String
  }

initModel:Model
initModel = 
  {   todo = ""
    , todos = []
  }

stylesheet =
  let
      tag = "link"
      attrs = 
        [ attribute "Rel" "stylesheet"
        , attribute "property" "stylesheet" 
        , attribute "href" "./styles.css" 
        ]
      children = 
          []
  in
    node tag attrs children 

type Msg 
  = UpdateTodo String
  | AddTodo
  | RemoveAll
  | RemoveItem String

update: Msg -> Model -> Model
update msg model =   
  case msg of
    UpdateTodo text ->
        {model | todo = text}
    AddTodo -> 
      { model | todos = model.todo :: model.todos}
    RemoveAll ->
      { model | todos = []}
    RemoveItem text ->
      { model | todos = (List.filter (\t -> t /= text) model.todos)}


todoItem todo =
  li [] [ text todo, button [ onClick (RemoveItem todo)] [ text "x"] ]

todoList todos =
  let
      child =
        List.map todoItem todos    
  in
    child |> ul []
  


  