module Util.Random exposing
    ( RandomItemGeneratorState
    , generateRandomItem
    , randomItemGeneratorState
    , updateRandomItemGeneratorState
    )

import Random exposing (Generator)
import Random.List exposing (choose)


type alias RandomItemGeneratorState a =
    { otherItems : List a
    , activeItem : a
    , defaultItem : a
    }


generateRandomItem : RandomItemGeneratorState a -> Generator ( Maybe a, List a )
generateRandomItem state =
    choose state.otherItems


randomItemGeneratorState : a -> List a -> RandomItemGeneratorState a
randomItemGeneratorState defaultItem otherItems =
    RandomItemGeneratorState otherItems defaultItem defaultItem


updateRandomItemGeneratorState : RandomItemGeneratorState a -> Maybe a -> List a -> RandomItemGeneratorState a
updateRandomItemGeneratorState state newItem otherItems =
    let
        activeItem =
            Maybe.withDefault state.defaultItem newItem
    in
    { state
        | activeItem = activeItem
        , otherItems = state.activeItem :: otherItems
    }
