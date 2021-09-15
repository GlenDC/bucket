module Page.About exposing (Data, Model, Msg, page)

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
    { title = WebPageTitleAbout
    , body =
        [ L18nHtml.mdBlock model.translate [] <|
            WebPageAboutIntro
                { creatorElizabeth = "[Elizabeth C. Gonzales Belsuzarri](https://www.linkedin.com/in/elizabeth-gonzales-belsuzarri-72173214/)"
                , creatorGlen = "[Glen Henri J. De Cauwsemaecker](https://www.glendc.com/)"
                , emailElizabeth = "[elizabeth@bckt.xyz](mailto:elizabeth@bckt.xyz)"
                , emailGlen = "[glen@bckt.xyz](mailto:glen@bckt.xyz)"
                }
        ]
    }
