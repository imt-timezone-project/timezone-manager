module Main exposing (..)

import Dict
import Html
import Html.Attributes
import Html.Events
import Dict
import Task
import Time exposing (Time)
import Time.DateTime as DateTime
import Time.TimeZone as TimeZone
import Time.TimeZones as TimeZones
import Time.ZonedDateTime as ZonedDateTime
import Time.TimeZones exposing (europe_paris, america_new_york, america_vancouver)
import Material.Slider as Slider


type alias ParticipantName =
    String


type alias TimeZoneName =
    String


type alias Model =
    { participants : Dict.Dict ParticipantName TimeZoneName
    , participantName : Maybe ParticipantName
    , selectedTimeZone : Maybe TimeZoneName
    , time : DateTime.DateTime
    , sliderBaseTime : DateTime.DateTime
    , todayYear : Int
    , sliderValue : Int
    }


type Msg
    = AddTimeZone
    | ParticipantName ParticipantName
    | SelectTimeZone TimeZoneName
    | RemoveParticipant TimeZoneName
    | OnTime Time
    | ChangeTime TimeMsg String
    | GetTime
    | SliderMsg Float


type TimeMsg
    = Day
    | Month
    | Year
    | Hour
    | Minute


emptySelectValue =
    "Select a timezone"



-- Model


init : ( Model, Cmd Msg )
init =
    ( { participants = Dict.fromList <| List.map2 (,) [ "Thomas", "Ethan", "Benson" ] (List.map TimeZone.name [ europe_paris (), america_new_york (), america_vancouver () ])
      , participantName = Nothing
      , selectedTimeZone = Nothing
      , time = DateTime.fromTimestamp 0
      , todayYear = 0
      , sliderBaseTime = DateTime.fromTimestamp 0
      , sliderValue = 0
      }
    , getCurrentTime
    )


getCurrentTime : Cmd Msg
getCurrentTime =
    Time.now
        |> Task.perform OnTime



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnTime time ->
            let
                datetime =
                    DateTime.fromTimestamp time
            in
                ( { model
                    | time = datetime
                    , sliderBaseTime = datetime
                    , sliderValue = 0
                    , todayYear = (DateTime.year datetime)
                  }
                , Cmd.none
                )

        GetTime ->
            ( model, getCurrentTime )

        AddTimeZone ->
            case model.participants of
                Nothing ->
                    ( model, Cmd.none )

                Just timezoneName ->
                    case model.participantName of
                        Nothing ->
                            ( model, Cmd.none )

                        Just participantName ->
                            ( { model
                                | participants = Dict.insert participantName timezoneName model.participants
                                , selectedTimeZone = Nothing
                              }
                            , Cmd.none
                            )

        ParticipantName name ->
            ( { model | participantName = Just name }, Cmd.none )

        SelectTimeZone name ->
            if name == emptySelectValue then
                ( { model | selectedTimeZone = Nothing }, Cmd.none )
            else
                ( { model | selectedTimeZone = Just name }, Cmd.none )

        RemoveParticipant name ->
            ( { model | participants = Dict.remove name model.participants }, Cmd.none )

        ChangeTime event value ->
            let
                time =
                    (timeUpdate event value model.time)
            in
                ( { model
                    | time = time
                    , sliderValue = 0
                    , sliderBaseTime = time
                  }
                , Cmd.none
                )

        SliderMsg value ->
            let
                sliderValue =
                    round value
            in
                ( { model
                    | time = (DateTime.addMinutes sliderValue model.sliderBaseTime)
                    , sliderValue = sliderValue
                  }
                , Cmd.none
                )


timeUpdate : TimeMsg -> String -> DateTime.DateTime -> DateTime.DateTime
timeUpdate msg value time =
    case msg of
        Day ->
            DateTime.setDay (Result.withDefault 0 (String.toInt value)) time

        Month ->
            DateTime.setMonth (Result.withDefault 0 (String.toInt value)) time

        Year ->
            DateTime.setYear (Result.withDefault 0 (String.toInt value)) time

        Hour ->
            DateTime.setHour (Result.withDefault 0 (String.toInt value)) time

        Minute ->
            DateTime.setMinute (Result.withDefault 0 (String.toInt value)) time



-- Views


title : Html.Html Msg
title =
    Html.h1 [] [ Html.text "Timezone Manager" ]



-- Form


timeZoneOption : Maybe String -> String -> Html.Html Msg
timeZoneOption selected value =
    let
        isSelected =
            case selected of
                Nothing ->
                    False

                Just name ->
                    name == value
    in
        Html.option
            [ Html.Attributes.selected isSelected
            ]
            [ Html.text value ]


buildTimeZonesOptions : Maybe String -> List (Html.Html Msg)
buildTimeZonesOptions selectedTimeZone =
    Dict.keys TimeZones.all
        |> List.map (timeZoneOption selectedTimeZone)


addTimezoneForm : Maybe String -> Html.Html Msg
addTimezoneForm selectedTimeZone =
    let
        emptySelected =
            case selectedTimeZone of
                Nothing ->
                    True

                Just _ ->
                    False
    in
        Html.div []
            [ Html.select
                [ Html.Events.onInput SelectTimeZone
                ]
                ([ Html.option
                    [ Html.Attributes.selected emptySelected
                    ]
                    [ Html.text emptySelectValue ]
                 ]
                    ++ buildTimeZonesOptions selectedTimeZone
                )
            , Html.button [ Html.Events.onClick AddTimeZone ] [ Html.text "Add" ]
            ]



-- Table


getTime : DateTime.DateTime -> ( ParticipantName, TimeZoneName ) -> Html.Html Msg
getTime currentTime ( participantName, timeZone ) =
    let
        timezone =
            TimeZones.fromName timeZone

        iso8601 =
            case timezone of
                Nothing ->
                    "Unknown"

                Just tz ->
                    ZonedDateTime.fromDateTime tz currentTime
                        |> ZonedDateTime.toISO8601

        time =
            case timezone of
                Nothing ->
                    "Unknown"

                Just tz ->
                    showDate <| ZonedDateTime.fromDateTime tz currentTime
    in
        Html.tr []
            [ Html.td [] [ Html.text timeZone ]
            , Html.td [] [ Html.abbr [ Html.Attributes.title iso8601 ] [ Html.text time ] ]
            , Html.td [] [ Html.a [ Html.Attributes.href "#", Html.Events.onClick (RemoveParticipant participantName) ] [ Html.text "X" ] ]
            ]


displayTime : Dict.Dict ParticipantName TimeZoneName -> DateTime.DateTime -> Html.Html Msg
displayTime participants currentTime =
    Html.table []
        ([ Html.tr []
            [ Html.th [] [ Html.text "TimeZone" ]
            , Html.th [] [ Html.text "Time" ]
            ]
         ]
            ++ (Dict.values participants
                    |> List.map (getTime currentTime)
               )
        )


zfill : Int -> String
zfill value =
    let
        string =
            toString value
    in
        if (String.length string) == 1 then
            "0" ++ string
        else
            string


showDate : ZonedDateTime.ZonedDateTime -> String
showDate datetime =
    let
        day =
            ZonedDateTime.day datetime

        month =
            ZonedDateTime.month datetime

        year =
            ZonedDateTime.year datetime

        hour =
            ZonedDateTime.hour datetime

        minute =
            ZonedDateTime.minute datetime
    in
        (zfill day) ++ "/" ++ (zfill month) ++ "/" ++ (toString year) ++ " " ++ (zfill hour) ++ ":" ++ (zfill minute)



-- Change Time Form


selectValue : TimeMsg -> Int -> Int -> Int -> Html.Html Msg
selectValue event start stop current_value =
    List.range start stop
        |> List.map
            (\x ->
                Html.option
                    [ Html.Attributes.selected (x == current_value) ]
                    [ Html.text <| zfill x
                    ]
            )
        |> Html.select [ Html.Events.onInput (ChangeTime event) ]


changeTimeForm : DateTime.DateTime -> Int -> Int -> Html.Html Msg
changeTimeForm time todayYear sliderValue =
    Html.div []
        [ Html.h3 [] [ Html.text "Change UTC time" ]
        , selectValue Day 1 31 <| DateTime.day time
        , selectValue Month 1 12 <| DateTime.month time
        , selectValue Year todayYear (todayYear + 3) <| DateTime.year time
        , selectValue Hour 0 23 <| DateTime.hour time
        , selectValue Minute 0 59 <| DateTime.minute time
        , Html.button [ Html.Events.onClick GetTime ] [ Html.text "Now" ]
        , Html.br [] []
        , Slider.view
            [ Slider.onChange SliderMsg
            , Slider.value <| toFloat sliderValue
            , Slider.max 1440
            , Slider.min -1440
            ]
        ]


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ title
        , displayTime model.participants model.time
        , addTimezoneForm model.participants
        , changeTimeForm model.time model.todayYear model.sliderValue
        , Html.footer []
            [ Html.a
                [ Html.Attributes.href "https://github.com/imt-timezone-project/timezone-manager/"
                ]
                [ Html.text "Source code" ]
            ]
        ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
