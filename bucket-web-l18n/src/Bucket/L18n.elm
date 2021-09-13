module Bucket.L18n exposing
    ( Language(..)
    , translate
    )

import Bucket.L18n.Languages.En
import Bucket.L18n.Languages.Es
import Bucket.L18n.Languages.Nl
import Bucket.L18n.Types exposing (Text(..))


type Language
    = En
    | Nl
    | Es


translate : Language -> Text -> String
translate lang text =
    case lang of
        En ->
            Bucket.L18n.Languages.En.translate text

        Nl ->
            case Bucket.L18n.Languages.Nl.translate text of
                Just t ->
                    t

                Nothing ->
                    Bucket.L18n.Languages.En.translate text

        Es ->
            case Bucket.L18n.Languages.Es.translate text of
                Just t ->
                    t

                Nothing ->
                    Bucket.L18n.Languages.En.translate text
