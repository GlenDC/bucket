module Pages.NotFound exposing (view)

import Html
import UI
import View exposing (View)

view : View msg
view =
    { title = "Bucket App — 404"
    , body = UI.layout [ Html.text
        """
        This drop could not be found,
        look inwards and continue your journey :)
        """
        ]
    }