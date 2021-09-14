module Page.Index exposing (Data, Model, Msg, page)

import Browser.Navigation
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
import Path exposing (Path)
import Random
import Shared
import View exposing (View)
import Task


type alias Model =
    { randomIntroTopic : Text
    , randomIntroSubject : Text
    }


type Msg
    = GenerateRandomIndices
    | NewRandomIndices ( Int, Int )


type alias RouteParams =
    {}


page : PageWithState RouteParams Data Model Msg
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildWithLocalState { init = init, update = update, subscriptions = subscriptions, view = view }


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


randomIntroTopic : Int -> Text
randomIntroTopic index =
    case modBy 4 index of
        1 ->
            WebPageHomeIntroTopicB

        2 ->
            WebPageHomeIntroTopicC

        3 ->
            WebPageHomeIntroTopicD

        _ ->
            WebPageHomeIntroTopicA


randomIntroSubject : Int -> Text
randomIntroSubject index =
    case modBy 4 index of
        1 ->
            WebPageHomeIntroSubjectB

        2 ->
            WebPageHomeIntroSubjectC

        3 ->
            WebPageHomeIntroSubjectD

        _ ->
            WebPageHomeIntroSubjectA


init :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> ( Model, Cmd Msg )
init maybeUrl model static =
    ( Model WebPageHomeIntroTopicA WebPageHomeIntroSubjectA
    , Task.succeed GenerateRandomIndices |> Task.perform identity
    )


update :
    PageUrl
    -> Maybe Browser.Navigation.Key
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> Msg
    -> Model
    -> ( Model, Cmd Msg )
update pageUrl maybeNavKey sharedModel static msg model =
    case msg of
        GenerateRandomIndices ->
            ( model, Random.generate NewRandomIndices (Random.pair (Random.int 0 4) (Random.int 0 4)) )

        NewRandomIndices ( indexTopic, indexSubject ) ->
            ( Model (randomIntroTopic indexTopic) (randomIntroSubject indexSubject), Cmd.none )


subscriptions :
    Maybe PageUrl
    -> RouteParams
    -> Path
    -> Model
    -> Sub Msg
subscriptions maybeUrl route path model =
    Sub.none


view :
    Maybe PageUrl
    -> Shared.Model
    -> Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel model static =
    { title = WebPageTitleHome
    , body =
        [ Html.div []
            [ L18nHtml.paragraph sharedModel.translate [] <|
                WebPageHomeIntro
                    { subject = sharedModel.translate model.randomIntroSubject
                    , topic = sharedModel.translate model.randomIntroTopic
                    }
            ]
        ]
    }
