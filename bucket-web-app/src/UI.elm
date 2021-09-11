module UI exposing (layout)

import Html exposing (Html)
import Html.Attributes as Attr
import Gen.Route as Route exposing (Route)

-- TODO: investigate Elm UI and decide if we perhaps want that


layout : List (Html msg) -> List (Html msg)
layout children =
    let
        viewAnyLink : String -> String -> Html msg
        viewAnyLink label url =
            Html.a [ Attr.href url ] [ Html.text label ]

        viewLink : String -> Route -> Html msg
        viewLink label route =
            Html.a [ Attr.href (Route.toHref route) ] [ Html.text label ]
    in
    [ Html.div [ Attr.class "container" ]
        [ Html.header [ Attr.class "navbar" ]
            [ Html.strong [ Attr.class "brand" ] [ viewLink "Home" Route.Home_ ]
            , Html.div [ Attr.class "splitter" ] []
            , viewAnyLink "Back to website" "https://bckt.xyz/"
            , viewLink "Settings" Route.Settings
            ]
        , Html.main_ [] children
        ]
    ]