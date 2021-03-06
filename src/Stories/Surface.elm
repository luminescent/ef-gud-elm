module Stories.Surface exposing (Model, Msg, init, update, view)

import Breakpoint as BP
import Color as C
import Components.Surface as S
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Spacing as SP
import Utils exposing (loremIpsum)


type alias Model =
    { numClicks : Int }


type Msg
    = OnClick


init : Model
init =
    { numClicks = 0 }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnClick ->
            ( { model | numClicks = model.numClicks + 1 }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ div
            [ SP.paddingClass "" BP.Small SP.Medium
            , C.bgColor C.HelloPaper
            ]
            [ S.surface False
                []
                [ h3 [] [ text "This stuff is inside a boring surface" ]
                , p [] [ text loremIpsum ]
                ]
            ]
        , div
            [ C.bgColor C.EfGrey
            , SP.paddingClass "" BP.Small SP.Medium
            ]
            [ S.surface False
                [ S.outline ]
                [ h3 [] [ text "A surface can have an outline" ]
                , p [] [ text loremIpsum ]
                ]
            ]
        , div
            [ C.bgColor C.LegalPaper
            , SP.paddingClass "" BP.Small SP.Medium
            ]
            [ S.surface False
                [ S.shadow ]
                [ h3 [] [ text "Or it can have a shadow" ]
                , p [] [ text loremIpsum ]
                ]
            ]
        , div
            [ C.bgColor C.OutdoorPaper
            , SP.paddingClass "" BP.Small SP.Medium
            ]
            [ S.surface False
                [ S.deepShadow ]
                [ h3 [] [ text "And even a DEEP shadow" ]
                , p [] [ text loremIpsum ]
                ]
            ]
        , div
            [ C.bgColor C.White
            , SP.paddingClass "" BP.Small SP.Medium
            ]
            [ S.surface False
                [ S.deepShadow, S.rounded ]
                [ h3 [] [ text "And we can also have round corners" ]
                , p [] [ text loremIpsum ]
                ]
            ]
        , div
            [ C.bgColor C.EfGrey
            , SP.paddingClass "" BP.Small SP.Medium
            ]
            [ S.surface
                True
                [ S.onClick OnClick ]
                [ h3 [] [ text "We get interaction states if we wrap an <a> tag" ]
                , p []
                    [ text "Number of clicks: "
                    , span [] [ text <| String.fromInt model.numClicks ]
                    ]
                , p [] [ text loremIpsum ]
                ]
            ]
        ]
