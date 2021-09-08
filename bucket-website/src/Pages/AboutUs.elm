module Pages.AboutUs exposing (view)

import View exposing (View)
import UI
import Html


view : View msg
view =
    { title = "About Us"
    , body = UI.layout [ Html.text "Made with ❤️ by Elizabeth C. Gonzales Belsuzarri and Glen Henri J. De Cauwsemaecker." ]
    }

