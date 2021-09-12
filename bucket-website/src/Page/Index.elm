module Page.Index exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Html exposing (Html)
import Html.Attributes exposing ( href )
import Shared
import View exposing (View)

import Bucket.L18n as L18n


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
view maybeUrl sharedModel static =
    { title = "Home", body = [
        Html.div []
        [
            Html.p [] [
                Html.text "Track your activities, one drop at a time! "
            ],
            Html.p [] [
                Html.text L18n.hello
            ],
            Html.p [] [
                Html.text <| "Please come back later, Elizabeth and Glen are working hard "
                    ++ "on making this app a reality and provide you with a positive tool "
                    ++ "to keep you guilt-free on track ;)"
            ],
            Html.p [] [
                Html.text <| " In the future you'll be able to get a premium subscription for Bucket "
                    ++ "which will give you premium features such as cloud support, "
                    ++ "share options, and access to closed beta releases."
            ],
            Html.p [] [
                Html.text "You can check out the ",
                Html.a [ href "https://github.com/plabajo/bucket" ] [ Html.text "Source Code" ],
                Html.text " to track the progress, and reach out to us using our contact information on the ",
                Html.a [ href "/about-us" ] [ Html.text "About Us" ],
                Html.text " page."
            ]
        ]
    ]}
