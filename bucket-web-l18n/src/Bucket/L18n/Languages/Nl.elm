module Bucket.L18n.Languages.Nl exposing (translate)

import Bucket.L18n.Types exposing (Text(..))


translate : Text -> Maybe String
translate text =
    case text of
        -- Website: Page: Home
        WebPageTitleHome ->
            Just "Start Pagina"

        WebPageHomeIntro params ->
            String.concat
                [ "**Bucket** De Gratis en Open Source Tijds tracker voor "
                , params.subject
                , " wie "
                , params.topic
                , "."
                ]
            |> Just

        WebPageHomeIntroSubjectA ->
            Just "drukke ouders"

        WebPageHomeIntroSubjectB ->
            Just "iedereen"

        WebPageHomeIntroSubjectC ->
            Just "dromers"

        WebPageHomeIntroSubjectD ->
            Just "spelmakers"

        WebPageHomeIntroTopicA ->
            Just "ongelimiteerd wil groeien"

        WebPageHomeIntroTopicB ->
            Just "zijn toegewijd"

        WebPageHomeIntroTopicC ->
            Just"hun doelen bereiken"

        WebPageHomeIntroTopicD ->
            Just "zaken gedaan krijgen"

        -- Website: Page: Guide
        WebNavItemGuide ->
            Just "Handleiding"

        WebPageTitleGuide ->
            Just "Handleiding"

        WebPageGuideMessageIntro ->
            Just "Welkom bij de Bucket Handleiding!"

        WebPageBlogMessageIntro ->
            Just "Welkom op de Bucket Blog!"

        -- Website: References: Source Code
        WebNavItemSource ->
            Just "Bron Code"

        -- Website: Page: About
        WebNavItemAbout ->
            Just "Over Ons"

        WebPageTitleAbout ->
            Just "Over Ons"

        WebPageAboutIntroStart params ->
            Just <|
                String.concat
                    [ "**Bucket** is gemaakt met liefde en passie door "
                    , params.creatorElizabeth
                    , " en "
                    , params.creatorGlen
                    , "."
                    ]

        WebPageAboutIntroReachUs ->
            Just "Bereik ons door gebruik te maken van één van onderstaande addressen:"

        -- Website: Page: Donate
        WebNavItemDonate ->
            Just "Doneer"

        WebPageTitleDonate ->
            Just "Doneer"

        -- Website: Footer
        WebFooter params ->
            Just <|
                String.concat
                    [ "Bucket is gemaakt door "
                    , params.creatorElizabeth
                    , " en "
                    , params.creatorGlen
                    , ". The bron code is beschermd door de "
                    , params.copyrightApp
                    , " licentie. Deze website is beschermd door de "
                    , params.copyrightWeb
                    , " licentie."
                    ]

        _ ->
            Nothing
