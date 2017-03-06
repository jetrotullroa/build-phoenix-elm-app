module Model exposing (..)

import Phoenix.Socket
import Messages exposing (..)


type alias Model =
    { phxSocket : Phoenix.Socket.Socket Msg
    , messageInProgress : String
    , messages : List String
    }
