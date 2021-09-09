module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import Browser.Navigation
import DataSource
import Html exposing (Html)
import Html.Attributes exposing (class, id, href, attribute)
import Html.Attributes.Aria exposing (role, ariaLabel)
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)
import Html.Attributes.Aria exposing (ariaExpanded)
import Html.Attributes.Aria exposing (ariaHidden)


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
    }


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
    ( { showMobileMenu = True }
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

navItemWithIcon : String -> String -> String -> Html msg
navItemWithIcon label link icon =
    Html.a [ class "navbar-item", href link ]
    [
        Html.span [ class "icon is-small pr-3" ]
        [
            Html.i [ class icon ] []
        ],
        Html.span [] [ Html.text label ]
    ]

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
        [class "container"]
        [
            Html.nav
            [
                class "navbar",
                role "navigation",
                ariaLabel "main navigation"
            ]
            [
                Html.div
                [ class "navbar-brand" ]
                [
                    Html.a [ class "navbar-item", href "/" ]
                    [
                        Html.span [ class "icon is-small pr-3" ]
                        [
                            Html.i [ class "fas fa-tint" ] []
                        ],
                        Html.span [] [ Html.strong [] [ Html.text "Bucket" ] ]
                    ],
                    Html.a
                    [
                        role "button",
                        class "navbar-burger",
                        ariaLabel "menu",
                        ariaExpanded "false",
                        attribute "data-target" "navabarBucket"
                    ]
                    [
                        Html.span [ ariaHidden True ] [],
                        Html.span [ ariaHidden True ] [],
                        Html.span [ ariaHidden True ] []
                    ]
                ],
                Html.div
                [ id "navabarBucket", class "navbar-menu" ]
                [
                    Html.div
                    [ class "navbar-start" ]
                    [
                        navItemWithIcon "App" "/app" "fas fa-play",
                        navItemWithIcon "Guide" "/guide" "fas fa-book",
                        navItemWithIcon "Blog" "/blog" "fas fa-newspaper",
                        navItemWithIcon "Roadmap" "https://github.com/plabajo/bucket/milestones?direction=asc&sort=due_date&state=open" "fas fa-map"
                    ],
                    Html.div
                    [ class "navbar-end" ]
                    [
                        navItemWithIcon "Source" "https://github.com/plabajo/bucket" "fab fa-github",
                        navItemWithIcon "About Us" "/about-us" "fas fa-users",
                        navItemWithIcon "Donate" "/donate" "fas fa-heart"
                    ]
                ]
            ],
            Html.section
            [ class "section" ]
            pageView.body,
            Html.footer
            [ class "footer" ]
            [
                Html.div
                [ class "content has-text-centered" ]
                [
                    Html.p []
                    [
                        Html.strong [] [ Html.text "Bucket" ],
                        Html.text " by ",
                        Html.a [ href "https://www.linkedin.com/in/elizabeth-gonzales-belsuzarri-72173214/" ] [ Html.text "Elizabeth C. Gonzales Belsuzarri" ],
                        Html.text " and ",
                        Html.a [ href "https://www.glendc.com/" ] [ Html.text "Glen Henri J. De Cauwsemaecker" ],
                        Html.text ". The source code is licensed by ",
                        Html.a [ href "https://github.com/plabajo/bucket/blob/main/LICENSE" ] [ Html.text "GNU GPL v3" ],
                        Html.text ". The website content is licensed by ",
                        Html.a [ href "http://creativecommons.org/licenses/by-nc-sa/4.0/" ] [ Html.text "CC BY NC SA 4.0" ],
                        Html.text "."
                    ]
                ]
            ]
        ]
        
    , title = pageView.title
    }
