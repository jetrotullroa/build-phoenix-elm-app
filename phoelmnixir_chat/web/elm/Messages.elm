module Messages exposing (..)

import Phoenix.Socket


type Msg
    = Something
    | PhoenixMsg (Phoenix.Socket.Msg Msg)
