module Update exposing (..)

import Messages exposing (..)
import Model exposing (..)
import Phoenix.Socket


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Something ->
            ( model, Cmd.none )

        GetMessage message ->
            ( { model | messageInProgress = message }, Cmd.none )

        PhoenixMsg msg ->
            let
                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.update msg model.phxSocket
            in
                ( { model | phxSocket = phxSocket }
                , Cmd.map PhoenixMsg phxCmd
                )
