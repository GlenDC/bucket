module Page.Guide.Slug__ exposing (Data, Model, Msg, page)

import Bucket.Languages.Types as L18nTypes
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html
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
    { slug : Maybe String }


page : Page RouteParams Data
page =
    Page.prerender
        { head = head
        , routes = routes
        , data = data
        }
        |> Page.buildNoState { view = view }


routes : DataSource (List RouteParams)
routes =
    DataSource.succeed
        [ { slug = Nothing }
        , { slug = Just "intro" }
        ]


data : RouteParams -> DataSource Data
data routeParams =
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
    { title = model.translator L18nTypes.WebPageTitleGuide
    , body =
        [ Html.div []
            [ Html.p []
                [ Html.text <|
                    "Welcome on "
                        ++ (case static.routeParams.slug of
                                Just slug ->
                                    "guide page " ++ slug

                                Nothing ->
                                    "the guide!"
                           )
                ]
            ]
        ]
    }
