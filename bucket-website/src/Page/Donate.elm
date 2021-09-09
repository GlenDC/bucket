module Page.Donate exposing (Model, Msg, Data, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Html exposing (Html)
import Html.Attributes exposing (href)
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
view maybeUrl sharedModel static =
    { title = "Donate", body = [
        Html.div []
        [
            Html.p [] [
                Html.text <| "You can support us in many ways. "
                ++ "Contributing to our software and meta content is one way. "
                ++ "That can be done by heading over to our source code repository or reaching out to us. "
                ++ "Providing us with feedback is another way to support us."
            ],
            Html.p [] [
                Html.text <| " As we are however building, maintaining and supporting Bucket "
                ++ "and other Plabajo projects in our spare time, in between parenting, work and other duties, "
                ++ "some financial income is also welcome."
            ],
            Html.p [] [
                Html.text <| " In the future you'll be able to get a premium subscription for Bucket "
                    ++ "which will give you premium features such as cloud support, "
                    ++ "share options, and access to closed beta releases."
            ],
            Html.p [] [
                Html.text <| " You can also be a Patreon supporter. "
                    ++ "This way you'll provide us with a monthly amount of your choosing, "
                    ++ "which allows us to continue our work: ",
                Html.a [ href "https://patreon.com/plabajo" ] [ Html.text "patreon.com/plabajo" ],
                Html.text "."
            ]
        ]
    ]}
