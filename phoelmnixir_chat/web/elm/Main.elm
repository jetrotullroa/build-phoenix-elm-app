module Main exposing (..)

import Html exposing (..)
import View exposing (..)
import Model exposing (..)
import Messages exposing (..)
import Update exposing (..)
import Phoenix.Socket
import Phoenix.Channel
import Phoenix.Push


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
        wsUrl =
            "ws://localhost:4000/socket/websocket"

        model =
            { phxSocket = Phoenix.Socket.init wsUrl
            , messageInProgress = ""
            , messages = [ "Test message", "Second Message" ]
            }
    in
        ( model, Cmd.none )
