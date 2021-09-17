module Shared exposing (Data, Model, Msg(..), SharedMsg(..), seoSummary, template)

import Browser.Navigation
import Bucket.L18n as L18n
import Bucket.L18n.Html as L18nHtml
import Bucket.L18n.Types exposing (Text(..), Translator)
import DataSource
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes exposing (attribute, class, href, id)
import Html.Attributes.Aria exposing (ariaExpanded, ariaHidden, ariaLabel, role)
import Json.Decode
import Pages.Flags exposing (Flags(..))
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)
import Random


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    }


type Msg
    = OnPageChange
        { path : Path
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMobileMenu : Bool
    , translate : Translator
    , randomSeed : Random.Seed
    }


type alias Flags =
    { availableLocales : List String
    , initialRandomSeed : Int
    }


flagsDecoder : Json.Decode.Decoder Flags
flagsDecoder =
    Json.Decode.map2 Flags
        (Json.Decode.field "availableLocales" (Json.Decode.list Json.Decode.string))
        (Json.Decode.field "initialRandomSeed" Json.Decode.int)


init :
    Maybe Browser.Navigation.Key
    -> Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init navigationKey flags maybePagePath =
    let
        ( language, seed ) =
            case flags of
                BrowserFlags rawFlags ->
                    Json.Decode.decodeValue flagsDecoder rawFlags
                        |> Result.andThen (\df -> ( L18n.negotiateLanguage df.availableLocales, df.initialRandomSeed ) |> Ok)
                        |> Result.withDefault ( L18n.En, 0 )

                PreRenderFlags ->
                    ( L18n.En, 0 )
    in
    ( { showMobileMenu = True
      , translate = L18n.translate language
      , randomSeed = Random.initialSeed seed
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnPageChange _ ->
            ( { model | showMobileMenu = False }, Cmd.none )

        SharedMsg globalMsg ->
            ( model, Cmd.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


navItemWithIcon : Model -> Text -> String -> String -> Html msg
navItemWithIcon model label link icon =
    Html.a [ class "navbar-item", href link ]
        [ Html.span [ class "icon is-small pr-3" ]
            [ Html.i [ class icon ] []
            ]
        , Html.span [] [ L18nHtml.text model.translate label ]
        ]


seoSummary : Seo.Common
seoSummary =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Bucket Time Tracker"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "life long progress, one drop at a time"
        , locale = Nothing
        , title = "Bucket Time Tracker"
        }


view :
    Data
    ->
        { path : Path
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view sharedData page model toMsg pageView =
    { body =
        Html.div
            [ class "container" ]
            [ Html.nav
                [ class "navbar"
                , role "navigation"
                , ariaLabel "main navigation"
                ]
                [ Html.div
                    [ class "navbar-brand" ]
                    [ Html.a [ class "navbar-item", href "/" ]
                        [ Html.span [ class "icon is-small pr-3" ]
                            [ Html.i [ class "fas fa-tint" ] []
                            ]
                        , Html.span [] [ Html.strong [] [ Html.text "Bucket" ] ]
                        ]
                    , Html.a
                        [ role "button"
                        , class "navbar-burger"
                        , ariaLabel "menu"
                        , ariaExpanded "false"
                        , attribute "data-target" "navabarBucket"
                        ]
                        [ Html.span [ ariaHidden True ] []
                        , Html.span [ ariaHidden True ] []
                        , Html.span [ ariaHidden True ] []
                        ]
                    ]
                , Html.div
                    [ id "navabarBucket", class "navbar-menu" ]
                    [ Html.div
                        [ class "navbar-start" ]
                        [ navItemWithIcon model WebNavItemApp "https://app.bckt.xyz" "fas fa-play"
                        , navItemWithIcon model WebNavItemGuide "/guide" "fas fa-book"
                        , navItemWithIcon model WebNavItemBlog  "https://plabayo.tech/blog" "fas fa-newspaper"
                        , navItemWithIcon model WebNavItemRoadmap "https://github.com/plabayo/bucket/milestones?direction=asc&sort=due_date&state=open" "fas fa-map"
                        ]
                    , Html.div
                        [ class "navbar-end" ]
                        [ navItemWithIcon model WebNavItemSource "https://github.com/plabayo/bucket" "fab fa-github"
                        , navItemWithIcon model WebNavItemAbout "/about" "fas fa-users"
                        , navItemWithIcon model WebNavItemDonate "/donate" "fas fa-heart"
                        ]
                    ]
                ]
            , Html.section
                [ class "section" ]
                pageView.body
            , Html.footer
                [ class "footer" ]
                [ Html.div
                    [ class "content has-text-centered" ]
                    [ L18nHtml.mdBlock model.translate [] <|
                        WebFooter
                            { creatorElizabeth = "[Elizabeth C. Gonzales Belsuzarri](https://www.linkedin.com/in/elizabeth-gonzales-belsuzarri-72173214/)"
                            , creatorGlen = "[Glen Henri J. De Cauwsemaecker](https://www.glendc.com/)"
                            , copyrightApp = "[GNU GPL v3](https://github.com/plabayo/bucket/blob/main/LICENSE)"
                            , copyrightWeb = "[CC BY NC SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)"
                            }
                    ]
                ]
            ]
    , title = "Bucket — " ++ model.translate pageView.title
    }
