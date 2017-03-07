module Main exposing (..)

import Html exposing (..)
import View exposing (..)
import Model exposing (..)
import Messages exposing (..)
import Update exposing (..)
import Phoenix.Socket


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

        initSocket =
            Phoenix.Socket.init wsUrl
                |> Phoenix.Socket.withDebug
                |> Phoenix.Socket.on "shout" "room:lobby" ReceiveMessage

        model =
            { phxSocket = initSocket
            , messageInProgress = ""
            , messages = []
            }
    in
        ( model, Cmd.none )
