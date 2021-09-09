module Pages.Docs exposing (view)

import View exposing (View)
import UI
import Html


view : View msg
view =
    { title = "Documentation"
    , body = UI.layout [ Html.text "TODO: docs" ]
    }


