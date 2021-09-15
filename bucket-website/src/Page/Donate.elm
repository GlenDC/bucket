module Page.Donate exposing (Data, Model, Msg, page)

import Bucket.L18n.Html as L18nHtml
import Bucket.L18n.Types exposing (Text(..))
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes exposing (href)
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    ()


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Shared.seoSummary
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl model static =
    { title = WebPageTitleDonate
    , body =
        [ L18nHtml.mdBlock model.translate [] <|
            WebPageDonateIntro { linkPatreon = "[patreon.com/plabajo](https://patreon.com/plabajo)" }
        ]
    }
