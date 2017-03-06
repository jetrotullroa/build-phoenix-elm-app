module View exposing (..)

import Html exposing (..)
import Model exposing (..)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ ul []
            [ li [] [] ]
        , form []
            [ input [] []
            , button [] [ text "Submit" ]
            ]
        ]
