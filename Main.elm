module Main exposing (..)

import Date exposing (Month(..), Date)
import Date.Extra as DateExtra
import Html
import Html.Attributes
import Html.Events
import Time exposing (Time, second)
import Utils


-- Model


type Msg
    = Tick Time
    | NewDate String


type alias Model =
    { title : String
    , isoDate : String
    , currentTime : Time
    }



-- Init


init : ( Model, Cmd Msg )
init =
    Model "Timezone Manager Weekly Meeting" "2017-02-23T12:00:00Z" 0 ! []



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            { model | currentTime = newTime } ! []

        NewDate newDate ->
            { model | isoDate = newDate } ! []



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every second Tick
        ]



-- View


view : Model -> Html.Html Msg
view model =
    let
        date =
            case DateExtra.fromIsoString model.isoDate of
                Just date ->
                    date

                Nothing ->
                    DateExtra.fromParts 2017 Feb 21 15 30 0 0

        counter =
            if model.currentTime == 0 then
                ""
            else
                ("(" ++ (Utils.timeIn (Date.toTime date) model.currentTime) ++ ")")
    in
        Html.div [ Html.Attributes.id "wrap" ]
            [ Html.h1 [] [ Html.text model.title ]
            , Html.p [ Html.Attributes.id "local" ]
                [ Html.span
                    [ Html.Attributes.id "your"
                    , Html.Attributes.class "label"
                    ]
                    [ Html.text "Local time:" ]
                , Html.span [ Html.Attributes.class "val" ]
                    [ Html.text
                        (DateExtra.toFormattedString "EEE, MMM d, y 'at' HH:mm 'UTC' x" date)
                    ]
                , Html.span
                    [ Html.Attributes.id "delta"
                    , Html.Attributes.class "label"
                    ]
                    [ Html.text counter ]
                ]
            , Html.p [ Html.Attributes.id "ref" ]
                [ Html.span [ Html.Attributes.class "label" ]
                    [ Html.text "Universal Time:" ]
                , Html.span [ Html.Attributes.class "val" ]
                    [ Html.text
                        (DateExtra.toUtcFormattedString "EEE, MMM d, y 'at' HH:mm 'UTC'" date)
                    ]
                ]
            , Html.div []
                [ Html.input
                    [ Html.Attributes.value model.isoDate
                    , Html.Events.onInput NewDate
                    ]
                    []
                ]
            ]



-- Main


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
