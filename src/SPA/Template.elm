module SPA.Template exposing (..)
import Html exposing (div)
import Html.Attributes exposing (class)
import Html exposing (ul)
import Html exposing (li)
import Html exposing (a)
import Html.Attributes exposing (href)
import Html exposing (i)
import Html exposing (Html)
import SPA.Main exposing (Msg)
import Html.Attributes exposing (attribute)
import Html exposing (node)
import Html exposing (nav)
import Html exposing (header)
import Html exposing (span)
import Html exposing (img)
import Html.Attributes exposing (alt)
import Html.Attributes exposing (src)
import Html exposing (text)
import Html exposing (input)
import Html.Attributes exposing (placeholder)
import Html.Attributes exposing (type_)
import Html exposing (section)


main = 
  div [] 
    [ stylesheet
    , boxIcons
    , template
    , section [ class "home" ]
      [ div [ class "text" ]
      [ text "Dashboard Sidebar" ]
    ]
    ]


stylesheet : Html Msg
stylesheet =
  let 
    tag =
      "link"
    attrs =
      [ attribute "Rel" "stylesheet"
      , attribute "property" "stylesheet"
      , attribute "href" "style.css"
      ]
    children = []
  in 
    node tag attrs children
boxIcons : Html Msg
boxIcons =
  let 
    tag =
      "link"
    attrs =
      [ attribute "Rel" "stylesheet"
      , attribute "property" "stylesheet"
      , attribute "href" "https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css"
      ]
    children = []
  in 
    node tag attrs children
template : Html.Html msg
template =
  -- nav [ class "sidebar close" ]
  nav [ class "sidebar close" ]
  [ header []
    [ div [ class "image-text" ]
      [ span [ class "image" ]
        [ img [ src "logo.png", alt "" ]
          []
        ]
      , div [ class "text logo-text" ]
        [ span [ class "name" ]
          [ text "Codinglab" ]
        , span [ class "profession" ]
          [ text "Web developer" ]
        ]
      ]
    , i [ class "bx bx-chevron-right toggle" ]
      []
    ]
  , div [ class "menu-bar" ]
    [ div [ class "menu" ]
      [ li [ class "search-box" ]
        [ i [ class "bx bx-search icon" ]
          []
        , input [ type_ "text", placeholder "Search..." ]
          []
        ]
      , ul [ class "menu-links" ]
        [ li [ class "nav-link" ]
          [ a [ href "#" ]
            [ i [ class "bx bx-home-alt icon" ]
              []
            , span [ class "text nav-text" ]
              [ text "Dashboard" ]
            ]
          ]
        , li [ class "nav-link" ]
          [ a [ href "#" ]
            [ i [ class "bx bx-bar-chart-alt-2 icon" ]
              []
            , span [ class "text nav-text" ]
              [ text "Revenue" ]
            ]
          ]
        , li [ class "nav-link" ]
          [ a [ href "#" ]
            [ i [ class "bx bx-bell icon" ]
              []
            , span [ class "text nav-text" ]
              [ text "Notifications" ]
            ]
          ]
        , li [ class "nav-link" ]
          [ a [ href "#" ]
            [ i [ class "bx bx-pie-chart-alt icon" ]
              []
            , span [ class "text nav-text" ]
              [ text "Analytics" ]
            ]
          ]
        , li [ class "nav-link" ]
          [ a [ href "#" ]
            [ i [ class "bx bx-heart icon" ]
              []
            , span [ class "text nav-text" ]
              [ text "Likes" ]
            ]
          ]
        , li [ class "nav-link" ]
          [ a [ href "#" ]
            [ i [ class "bx bx-wallet icon" ]
              []
            , span [ class "text nav-text" ]
              [ text "Wallets" ]
            ]
          ]
        ]
      ]
    , div [ class "bottom-content" ]
      [ li [ class "" ]
        [ a [ href "#" ]
          [ i [ class "bx bx-log-out icon" ]
            []
          , span [ class "text nav-text" ]
            [ text "Logout" ]
          ]
        ]
      , li [ class "mode" ]
        [ div [ class "sun-moon" ]
          [ i [ class "bx bx-moon icon moon" ]
            []
          , i [ class "bx bx-sun icon sun" ]
            []
          ]
        , span [ class "mode-text text" ]
          [ text "Dark mode" ]
        , div [ class "toggle-switch" ]
          [ span [ class "switch" ]
            []
          ]
        ]
      ]
    ]
  ]
  