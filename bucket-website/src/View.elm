module View exposing (View, map, placeholder)

import Html exposing (Html)
import Bucket.L18n.Types exposing (Text(..))


type alias View msg =
    { title : Text
    , body : List (Html msg)
    }


map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn doc =
    { title = doc.title
    , body = List.map (Html.map fn) doc.body
    }


placeholder : String -> View msg
placeholder moduleName =
    { title = Bucket
    , body = [ Html.text moduleName ]
    }
