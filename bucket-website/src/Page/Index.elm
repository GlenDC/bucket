module Page.Index exposing (Data, Model, Msg, page)

import Bucket.L18n.Types exposing (Text(..))
import Bucket.L18n.Html as L18nHtml
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes exposing (href)
import Page exposing (Page, StaticPayload)
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


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Shared.seoSummary
        |> Seo.website


type alias Data =
    ()


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl model static =
    { title = WebPageTitleHome
    , body =
        [ Html.div []
            [ L18nHtml.paragraph model.translate [] WebPageHomeIntroP1
            , L18nHtml.paragraph model.translate [] WebPageHomeIntroP2
            , L18nHtml.paragraph model.translate [] WebPageHomeIntroP3
            , L18nHtml.paragraph model.translate [] <| WebPageHomeIntroP4
                    { linkRepository = "https://github.com/plabajo/bucket"
                    , linkAboutUs = "/about"
                    }
            ]
        ]
    }
