module Bucket.L18n.Languages.En exposing (translate)

import Bucket.L18n.Types exposing (Text(..))


translate : Text -> String
translate text =
    case text of
        -- Misc
        Bucket ->
            "Bucket"

        -- Website: Page: Home
        WebPageTitleHome ->
            "Home"

        WebPageHomeIntro params ->
            String.concat
                [ "**Bucket** The Free and Open Source Time Tracker for _"
                , params.subject
                , """_

who _"""
                , params.topic
                , "_."
                ]

        WebPageHomeIntroSubjectA ->
            "busy parents"

        WebPageHomeIntroSubjectB ->
            "everyone"

        WebPageHomeIntroSubjectC ->
            "dreamers"

        WebPageHomeIntroSubjectD ->
            "game changers"

        WebPageHomeIntroTopicA ->
            "grow forever"

        WebPageHomeIntroTopicB ->
            "are dedicated"

        WebPageHomeIntroTopicC ->
            "reach their goals"

        WebPageHomeIntroTopicD ->
            "get things done"

        -- Website: References: App
        WebNavItemApp ->
            "App"

        -- Website: Page: Guide
        WebNavItemGuide ->
            "Guide"

        WebPageTitleGuide ->
            "Guide"

        WebPageGuideMessageIntro ->
            "Welcome to the Bucket Guide!"

        -- Website: Page: Blog
        WebNavItemBlog ->
            "Blog"

        WebPageTitleBlog ->
            "Blog"

        WebPageBlogMessageIntro ->
            "Welcome on the Bucket Blog!"

        -- Website: References: Roadmap
        WebNavItemRoadmap ->
            "Roadmap"

        -- Website: References: Source Code
        WebNavItemSource ->
            "Source Code"

        -- Website: Page: About
        WebNavItemAbout ->
            "About Us"

        WebPageTitleAbout ->
            "About Us"

        WebPageAboutIntro params ->
            String.concat
                [ "**Bucket** is made with love and dedication by "
                , params.creatorElizabeth
                , " and "
                , params.creatorGlen
                , "."
                , """

Should you wish, please reach out to us as follows:

- Elizabeth can be messaged by mail at """
                , params.emailElizabeth
                , """;
- and Glen can be mailed using """
                , params.creatorGlen
                , "."
                ]

        -- Website: Page: Donate
        WebNavItemDonate ->
            "Donate"

        WebPageTitleDonate ->
            "Donate"

        WebPageDonateIntro params ->
            """
You can support us in many ways.
Contributing to our software and meta content is one way.
That can be done by heading over to our source code repository or reaching out to us.
Providing us with feedback is another way to support us.

As we are however building, maintaining and supporting Bucket
and other Plabajo projects in our spare time, in between parenting, work and other duties,
some financial income is also welcome.

In the future you'll be able to get a premium subscription for Bucket
which will give you premium features such as cloud support,
share options, and access to closed beta releases.

You can also be a Patreon supporter.
This way you'll provide us with a monthly amount of your choosing,
which allows us to continue our work:
            """
                ++ params.linkPatreon

        -- Website: Footer
        WebFooter params ->
            String.concat
                [ "Bucket by "
                , params.creatorElizabeth
                , " and "
                , params.creatorGlen
                , ". The source code is licensed by "
                , params.copyrightApp
                , ". This website is licensed by "
                , params.copyrightWeb
                , "."
                ]

        -- App: Page: Home
        AppPageHomeTitle ->
            "Bucket App"

        AppPageHomeIntro ->
            """
Track your activities, one drop at a time!

Please come back later,
Elizabeth and Glen are working hard on making this
app a reality and provide you with a positive
tool to keep you guilt-free on track ;)
            """

        -- App: Page: Settings
        AppPageSettingsTitle ->
            "Bucket Settings"

        AppPageSettingsIntro ->
            """
            No settings exposed yet, nothing to see here.
            """

        -- App: Page: Not Found
        AppPageNotFoundTitle ->
            "Bucket App — 404"

        AppPageNotFoundIntro ->
            """
            This drop could not be found,
            look inwards and continue your journey :)
            """
