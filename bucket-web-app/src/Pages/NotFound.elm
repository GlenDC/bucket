module Pages.NotFound exposing (page)

import UI
import View exposing (View)
import Page exposing (Page)
import Shared exposing (Model)
import Request exposing (Request)
import Bucket.L18n.Types exposing (Text(..))
import Bucket.L18n.Html as L18nHtml

page : Model -> Request -> Page
page model req =
    Page.static
        { view = view model
        }

view : Model -> View msg
view model =
    { title = model.translate AppPageNotFoundTitle
    , body = UI.layout
        [ L18nHtml.paragraph model.translate [] AppPageNotFoundIntro
        ]
    }