module Commands exposing (..)

import Decoders exposing (..)
import Http
import Messages exposing (..)


fetch : Cmd Msg
fetch =
    let
        apiUrl =
            "api/contacts"

        request =
            Http.get apiUrl contactListDecoder
    in
        Http.send FetchResult request
