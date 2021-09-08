module Pages.Donate exposing (view)

import View exposing (View)
import UI
import Html
import Html.Attributes as Attr


view : View msg
view =
    { title = "Donate"
    , body = UI.layout [
        Html.text
            """
            You can support us in many ways. Contributing to our software
            and meta content is one way. That can be done by heading over to
            our source code repository or reaching out to us.
            
            Providing us with feedback is another way to support us.
            
            As we are however building, maintaining and supporting Bucket
            and other Plabajo projects in our spare time, in between parenting,
            work and other duties, some financial income is also welcome.
            
            In the future you'll be able to get a premium subscription for Bucket
            which will give you premium features such as cloud support, share options,
            and access to closed beta releases.
            
            You can also be a Patreon supporter. This way you'll provide us with a monthly
            amount of your choosing, which allows us to continue our work.
            """
        , Html.a
            [ Attr.href "https://www.patreon.com/plabajo" ]
            [ Html.text "patreon.com/plabajo" ]
        ]
    }

