module View exposing (..)

import Html exposing (..)
import Model exposing (..)
import Messages exposing (..)


view : Model -> Html Msg
view model =
    let
        drawMessages messages =
            messages |> List.map drawMessage
    in
        div []
            [ ul []
                (model.messages |> drawMessages)
            , form []
                [ input [] []
                , button [] [ text "Submit" ]
                ]
            ]


drawMessage : String -> Html Msg
drawMessage message =
    li [] [ text message ]
