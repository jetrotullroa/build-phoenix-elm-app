module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
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
            , Html.form []
                [ input
                    [ onInput GetMessage
                    , placeholder "Your message here ..."
                    ]
                    []
                , button [] [ text "Submit" ]
                ]
            ]


drawMessage : String -> Html Msg
drawMessage message =
    li [] [ text message ]
