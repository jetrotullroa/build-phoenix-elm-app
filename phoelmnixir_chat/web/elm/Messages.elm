module Messages exposing (..)

import Phoenix.Socket


type Msg
    = Something
    | GetMessage String
    | PhoenixMsg (Phoenix.Socket.Msg Msg)
