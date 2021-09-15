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
import Task
import Time
import Util.Random exposing (RandomItemGeneratorState, generateRandomItem, nextRandomActiveItem, randomItemGeneratorState, updateRandomItemGeneratorState)
import View exposing (View)


type alias Model =
    { randomIntroSubjects : RandomItemGeneratorState Text
    , randomIntroTopics : RandomItemGeneratorState Text
    }


type Msg
    = GenerateRandomSubjectAndTopic Time.Posix
    | NewRandomSubjectAndTopic ( ( Maybe Text, List Text ), ( Maybe Text, List Text ) )


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


init :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> ( Model, Cmd Msg )
init maybeUrl sharedModel static =
    let
        ( nextSeed, randomIntroSubjects ) =
            randomItemGeneratorState WebPageHomeIntroSubjectA
                [ WebPageHomeIntroSubjectB, WebPageHomeIntroSubjectC, WebPageHomeIntroSubjectD ]
                |> nextRandomActiveItem sharedModel.randomSeed

        ( _, randomIntroTopics ) =
            randomItemGeneratorState WebPageHomeIntroTopicA
                [ WebPageHomeIntroTopicB, WebPageHomeIntroTopicC, WebPageHomeIntroTopicD ]
                |> nextRandomActiveItem nextSeed
    in
    ( Model randomIntroSubjects randomIntroTopics
    , Cmd.none
      -- Task.succeed GenerateRandomSubjectAndTopic |> Task.perform identity
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
        GenerateRandomSubjectAndTopic _ ->
            let
                cmd =
                    Random.pair
                        (generateRandomItem model.randomIntroSubjects)
                        (generateRandomItem model.randomIntroTopics)
                        |> Random.generate NewRandomSubjectAndTopic
            in
            ( model, cmd )

        NewRandomSubjectAndTopic ( ( maybeNewSubject, otherSubjects ), ( maybeNewTopic, otherTopics ) ) ->
            let
                newModel =
                    { model
                        | randomIntroSubjects = updateRandomItemGeneratorState model.randomIntroSubjects maybeNewSubject otherSubjects
                        , randomIntroTopics = updateRandomItemGeneratorState model.randomIntroTopics maybeNewTopic otherTopics
                    }
            in
            ( newModel, Cmd.none )


subscriptions :
    Maybe PageUrl
    -> RouteParams
    -> Path
    -> Model
    -> Sub Msg
subscriptions maybeUrl route path model =
    -- Generate a new random topic & subject in hero banner every 3s
    Time.every 3000 GenerateRandomSubjectAndTopic


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
            [ L18nHtml.mdBlock sharedModel.translate [] <|
                WebPageHomeIntro
                    { subject = sharedModel.translate model.randomIntroSubjects.activeItem
                    , topic = sharedModel.translate model.randomIntroTopics.activeItem
                    }
            ]
        ]
    }
