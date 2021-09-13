module TestL18n exposing (..)

import Bucket.L18n exposing (Language(..), translate)
import Bucket.L18n.Types exposing (Text(..))
import Expect
import Test exposing (..)


suite : Test
suite =
    describe "translate English phrases"
        [ test "simple phrase" <|
            \_ ->
                Expect.equal "Guide" <|
                    translate En WebNavItemGuide
        , test "phrase with context" <|
            \_ ->
                Expect.equal "Bucket by Elizabeth C. GB and Glen H. J. DC. The source code is licensed by GNU GPL v3. This website is licensed by CC BY NC SA 4.0." <|
                    translate En <| WebFooter 
                        { creatorElizabeth = "Elizabeth C. GB"
                        , creatorGlen = "Glen H. J. DC"
                        , copyrightApp = "GNU GPL v3"
                        , copyrightWeb = "CC BY NC SA 4.0"
                        }
        ]
