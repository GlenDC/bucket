module Pages.Home_ exposing (view)

import Html
import View exposing (View)


view : View msg
view =
    { title = "Bucket"
    , body = [ Html.text "Track your activities, one drop at a time!" ]
    }
