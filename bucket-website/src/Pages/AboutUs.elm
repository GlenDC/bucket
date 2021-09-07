module Pages.AboutUs exposing (view)

import View exposing (View)
import UI
import Html


view : View msg
view =
    { title = "About Us"
    , body = UI.layout [ Html.text "TODO: About Us" ]
    }

