module Messages exposing (..)

import Phoenix.Socket
import Json.Encode as JE exposing (..)


type Msg
    = Something
    | GetMessage String
    | SendMessage
    | PhoenixMsg (Phoenix.Socket.Msg Msg)
    | ReceiveMessage JE.Value
    | HandleSendError JE.Value
