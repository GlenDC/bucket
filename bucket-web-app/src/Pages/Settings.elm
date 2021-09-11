module Pages.Settings exposing (view)

import Html
import UI
import View exposing (View)

view : View msg
view =
    { title = "Bucket App — Settings"
    , body = UI.layout [ Html.text
        """
        No settings exposed yet, nothing to see here.
        """
        ]
    }