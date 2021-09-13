module Bucket.Languages.En exposing (translate)

import Bucket.Languages.Types exposing (Text(..))


translate : Text -> String
translate text =
    case text of
        WebPageTitleHome ->
            "Home"

        WebNavItemApp ->
            "App"

        WebNavItemGuide ->
            "Guide"

        WebPageTitleGuide ->
            "Guide"

        WebNavItemBlog ->
            "Blog"

        WebPageTitleBlog ->
            "Blog"

        WebNavItemRoadmap ->
            "Roadmap"

        WebNavItemSource ->
            "Source Code"

        WebNavItemAbout ->
            "About Us"

        WebPageTitleAbout ->
            "About Us"

        WebNavItemDonate ->
            "Donate"

        WebPageTitleDonate ->
            "Donate"

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

        AppPageTitleHome ->
            "Bucket App"