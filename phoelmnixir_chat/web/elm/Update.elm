module Update exposing (..)

import Messages exposing (..)
import Model exposing (..)
import Phoenix.Socket
import Phoenix.Push
import Json.Encode as JE exposing (..)
import Json.Decode as JD exposing (..)


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

                phxPush =
                    Phoenix.Push.init "shout" "room:lobby"
                        |> Phoenix.Push.withPayload payload
                        |> Phoenix.Push.onOk ReceiveMessage
                        |> Phoenix.Push.onError HandleSendError

                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.push phxPush model.phxSocket
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

        ReceiveMessage raw ->
            let
                someMessage =
                    JD.decodeString "messages" raw
            in
                case someMessage of
                    Ok message ->
                        ( { model | messages = message :: model.messages }, Cmd.none )

                    Err error ->
                        ( model, Cmd.none )

        HandleSendError _ ->
            let
                message =
                    "Failed to send Message"
            in
                ( { model | messages = message :: model.messages }, Cmd.none )
