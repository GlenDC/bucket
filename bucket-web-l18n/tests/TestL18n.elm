module TestL18n exposing (..)

import Expect
import Bucket.L18n as L18n
import Test exposing (..)


suite : Test
suite =
    describe "simple"
        [ test "2 char language" <|
                \_ ->
                    Expect.equal "Hello, L18n!" <|
                        L18n.hello
        ]
