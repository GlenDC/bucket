module Bucket.Languages.Nl exposing (translate)

import Bucket.Languages.Types exposing (Text(..))


translate : Text -> Maybe String
translate text =
    case text of
        _ ->
            Nothing