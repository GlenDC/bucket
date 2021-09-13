module Bucket.L18n.Html exposing (hyperlink, paragraph, text)

import Bucket.L18n
import Bucket.L18n.Types exposing (Text(..), Translator)
import Html exposing (Html)
import Html.Attributes


text : Translator -> Text -> Html msg
text translate txt =
    Html.text <| translate txt


paragraph : Translator -> List (Html.Attribute msg) -> Text -> Html msg
paragraph translate attributes txt =
    Html.p attributes [ text translate txt ]


hyperlink : Translator -> List (Html.Attribute msg) -> Text -> String -> Html msg
hyperlink translate attributes txt href =
    Html.a (attributes ++ [ Html.Attributes.href href ]) [ text translate txt ]
