module Decoders exposing (..)

import Json.Decode as JD exposing (..)
import Json.Decode.Extra as JDE exposing ((|:))
import Model exposing (..)


type alias ContactResponse =
    { contact : Maybe Contact
    , error : Maybe String
    }


contactListDecoder : JD.Decoder ContactList
contactListDecoder =
    succeed
        ContactList
        |: (field "entries" (list contactListDecoder))
        |: (field "page_number" int)
        |: (field "total_entries" int)
        |: (field "total_pages" int)


contactDecoder : JD.Decoder Contact
contactDecoder =
    succeed
        Contact
        |: (field "id" int)
        |: (field "first_name" string)
        |: (field "last_name" string)
        |: (field "gender" int)
        |: (field "birth_date" string)
        |: (field "location" string)
        |: (field "email" string)
        |: (field "headline" string)
        |: (field "picture" string)