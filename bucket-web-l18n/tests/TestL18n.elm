module TestL18n exposing (..)

import Bucket.L18n exposing (Language(..), negotiateLanguage, translate)
import Bucket.L18n.Types exposing (Text(..))
import Expect
import Test exposing (..)


suite : Test
suite =
    describe "test L18n module"
        [ test "negotiate towards English Locale from [en-Gb]" <|
            \_ ->
                Expect.equal En <|
                    negotiateLanguage [ "en-Gb" ]
        , test "negotiate towards English Locale from [en-US, en-Gb]" <|
            \_ ->
                Expect.equal En <|
                    negotiateLanguage [ "en-US", "en-Gb" ]
        , test "negotiate towards Spanish Locale from [ES]" <|
            \_ ->
                Expect.equal Es <|
                    negotiateLanguage [ "ES" ]
        , test "negotiate towards Dutch Locale from [nl, en-US, en-Gb, en]" <|
            \_ ->
                Expect.equal Nl <|
                    negotiateLanguage [ "nl", "en-US", "en-Gb", "en-us" ]
        , test "translate simple English phrase" <|
            \_ ->
                Expect.equal "Guide" <|
                    translate En WebNavItemGuide
        , test "translate English phrase with context" <|
            \_ ->
                Expect.equal "Bucket by Elizabeth C. GB and Glen H. J. DC. The source code is licensed by GNU GPL v3. This website is licensed by CC BY NC SA 4.0." <|
                    translate En <|
                        WebFooter
                            { creatorElizabeth = "Elizabeth C. GB"
                            , creatorGlen = "Glen H. J. DC"
                            , copyrightApp = "GNU GPL v3"
                            , copyrightWeb = "CC BY NC SA 4.0"
                            }
        ]
