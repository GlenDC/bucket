module Page.AboutUs exposing (Data, Model, Msg, page)

import Bucket.L18n.Types as L18nTypes
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
    { title = model.translator L18nTypes.WebPageTitleAbout
    , body =
        [ Html.div []
            [ Html.p []
                [ Html.strong [] [ Html.text "Bucket" ]
                , Html.text " is made with love and dedication by "
                , Html.a [ href "https://www.linkedin.com/in/elizabeth-gonzales-belsuzarri-72173214/" ] [ Html.text "Elizabeth C. Gonzales Belsuzarri" ]
                , Html.text " and "
                , Html.a [ href "https://www.glendc.com/" ] [ Html.text "Glen Henri J. De Cauwsemaecker" ]
                , Html.text "."
                ]
            ]
        , Html.div []
            [ Html.p []
                [ Html.text "Reach out to one of us as follows:"
                , Html.ul []
                    [ Html.li [] [ Html.a [ href "mailto:elizabeth@bckt.xyz" ] [ Html.text "elizabeth@bckt.xyz" ] ]
                    , Html.li [] [ Html.a [ href "mailto:glen@bckt.xyz" ] [ Html.text "glen@bckt.xyz" ] ]
                    ]
                ]
            ]
        ]
    }
