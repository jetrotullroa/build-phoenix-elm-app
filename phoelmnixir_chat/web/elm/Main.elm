module Main exposing (..)

import Html exposing (..)
import View exposing (..)
import Model exposing (..)
import Messages exposing (..)
import Update exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = always <| Sub.none
        }


init : ( Model, Cmd Msg )
init =
    let
        model =
            { messageInProgress = ""
            , messages = [ "Test message", "Second Message" ]
            }
    in
        ( model, Cmd.none )
