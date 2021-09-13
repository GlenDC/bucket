module Bucket.L18n exposing
    ( Language(..)
    , translate
    )

import Bucket.Languages.En
import Bucket.Languages.Es
import Bucket.Languages.Nl
import Bucket.Languages.Types exposing (Text(..))


type Language
    = En
    | Nl
    | Es


translate : Language -> Text -> String
translate lang text =
    case lang of
        En ->
            Bucket.Languages.En.translate text

        Nl ->
            case Bucket.Languages.Nl.translate text of
                Just t ->
                    t

                Nothing ->
                    Bucket.Languages.En.translate text

        Es ->
            case Bucket.Languages.Es.translate text of
                Just t ->
                    t

                Nothing ->
                    Bucket.Languages.En.translate text
