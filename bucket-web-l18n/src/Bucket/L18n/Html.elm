module Bucket.L18n.Html exposing (hyperlink, mdBlock, paragraph, text)

import Bucket.L18n
import Bucket.L18n.Types exposing (Text(..), Translator)
import Html exposing (Html)
import Html.Attributes
import Markdown.Parser
import Markdown.Renderer


text : Translator -> Text -> Html msg
text translate txt =
    Html.text <| translate txt


paragraph : Translator -> List (Html.Attribute msg) -> Text -> Html msg
paragraph translate attributes txt =
    Html.p attributes [ text translate txt ]


mdBlock : Translator -> List (Html.Attribute msg) -> Text -> Html msg
mdBlock translate attributes txt =
    let
        rawText =
            translate txt

        mdElementsResult =
            Markdown.Parser.parse rawText
                |> Result.mapError deadEndsToString
                |> Result.andThen (\ast -> Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer ast)
    in
    case mdElementsResult of
        Err _ ->
            Html.div attributes [ Html.text rawText ]

        Ok mdElements ->
            Html.div attributes mdElements


deadEndsToString deadEnds =
    deadEnds
        |> List.map Markdown.Parser.deadEndToString
        |> String.join "\n"


hyperlink : Translator -> List (Html.Attribute msg) -> Text -> String -> Html msg
hyperlink translate attributes txt href =
    Html.a (attributes ++ [ Html.Attributes.href href ]) [ text translate txt ]
