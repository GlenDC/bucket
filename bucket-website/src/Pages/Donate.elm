module Pages.Donate exposing (view)

import View exposing (View)
import UI
import Html


view : View msg
view =
    { title = "Donate"
    , body = UI.layout [ Html.text "TODO: Donation Page" ]
    }

