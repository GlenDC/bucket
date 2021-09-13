module Bucket.L18n.Types exposing (Text(..), Translator)


type
    Text
    -- Misc
    = Bucket
      -- Website: Page: Home
    | WebPageTitleHome
    | WebPageHomeIntroP1
    | WebPageHomeIntroP2
    | WebPageHomeIntroP3
    | WebPageHomeIntroP4
        { linkRepository : String
        , linkAboutUs : String
        }
      -- Website: References: App
    | WebNavItemApp
      -- Website: Page: Guide
    | WebNavItemGuide
    | WebPageTitleGuide
    | WebPageGuideMessageIntro
      -- Website: Page: Blog
    | WebNavItemBlog
    | WebPageTitleBlog
    | WebPageBlogMessageIntro
      -- Website: References: Roadmap
    | WebNavItemRoadmap
      -- Website: References: Source Code
    | WebNavItemSource
      -- Website: Page: About
    | WebNavItemAbout
    | WebPageTitleAbout
    | WebPageAboutIntroStart
        { creatorGlen : String
        , creatorElizabeth : String
        }
    | WebPageAboutIntroReachUs
      -- Website: Page: Donate
    | WebNavItemDonate
    | WebPageTitleDonate
    | WebPageDonateIntroP1
    | WebPageDonateIntroP2
    | WebPageDonateIntroP3
    | WebPageDonateIntroP4
        { linkPatreon : String
        }
      -- Website: Footer
    | WebFooter
        { creatorGlen : String
        , creatorElizabeth : String
        , copyrightApp : String
        , copyrightWeb : String
        }
      -- App: Page: Home
    | AppPageTitleHome
      -- App: Page: Not Found
    | AppPageTitleNotFound
    | AppPageNotFoundIntro


type alias Translator =
    Text -> String
