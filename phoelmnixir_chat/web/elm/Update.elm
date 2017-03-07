module Update exposing (..)

import Messages exposing (..)
import Model exposing (..)
import Phoenix.Socket
import Json.Encode as JE exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Something ->
            ( model, Cmd.none )

        GetMessage message ->
            ( { model | messageInProgress = message }, Cmd.none )

        SendMessage ->
            let
                payload =
                    JE.object
                        [ ( "message", JE.string model.messageInProgress ) ]
            in
                ( model, Cmd.none )

        PhoenixMsg msg ->
            let
                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.update msg model.phxSocket
            in
                ( { model | phxSocket = phxSocket }
                , Cmd.map PhoenixMsg phxCmd
                )

        ReceiveMessage message ->
            ( model, Cmd.none )

        HandleSendError message ->
            let
                message =
                    "Failed to send Message"
            in
                ( { model | messages = message :: model.messages }, Cmd.none )
