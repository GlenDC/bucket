module Bucket.L18n.Languages.Nl exposing (translate)

import Bucket.L18n.Types exposing (Text(..))


translate : Text -> Maybe String
translate text =
    case text of
        _ ->
            Nothing
