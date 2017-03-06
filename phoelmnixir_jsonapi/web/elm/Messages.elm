module Messages exposing (..)

import Http
import Model exposing (..)


type Msg
    = FetchResult (Result Http.Error ContactList)
