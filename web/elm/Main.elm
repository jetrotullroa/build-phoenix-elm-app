--- web/elm/Main.elm


module Main exposing (..)

import Html exposing (Html, text)
import Commands exposing (fetch)
import Messages exposing (..)
import Model exposing (..)
import Update exposing (..)
import View exposing (..)


main : Program Never Model Msg
main =
    Html.Program
        { init = init
        , view = view
        , update = update
        , subscription = always <| Sub.none
        }


init : ( Model, Cmd Msg )
init =
    initialModel ! [ fetch ]
