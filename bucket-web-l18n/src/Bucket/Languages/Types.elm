module Bucket.Languages.Types exposing (Text(..))


type Text
    = WebPageTitleHome
    | WebNavItemApp
    | WebNavItemGuide
    | WebPageTitleGuide
    | WebNavItemBlog
    | WebPageTitleBlog
    | WebNavItemRoadmap
    | WebNavItemSource
    | WebNavItemAbout
    | WebPageTitleAbout
    | WebNavItemDonate
    | WebPageTitleDonate
    | WebFooter
        { creatorGlen : String
        , creatorElizabeth : String
        , copyrightApp : String
        , copyrightWeb : String
        }
    | AppPageTitleHome
