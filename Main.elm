module Main exposing (..)

import Dict
import Html
import Html.Attributes
import Html.Events
import Set
import Task
import Time exposing (Time)
import Time.DateTime as DateTime
import Time.TimeZone as TimeZone
import Time.TimeZones as TimeZones
import Time.ZonedDateTime as ZonedDateTime
import Time.TimeZones exposing (europe_paris, america_new_york, america_vancouver)


type alias Model =
    { selectedTimeZones : Set.Set String
    , selectedTimeZone : Maybe String
    , time : DateTime.DateTime
    }


type Msg
    = AddTimeZone
    | SelectTimeZone String
    | RemoveTimeZone String
    | OnTime Time


emptySelectValue =
    "Select a timezone"



-- Model


init : ( Model, Cmd Msg )
init =
    ( { selectedTimeZones = Set.fromList <| List.map TimeZone.name [ europe_paris (), america_new_york (), america_vancouver () ]
      , selectedTimeZone = Nothing
      , time = DateTime.fromTimestamp 0
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
            ( { model | time = DateTime.fromTimestamp time }, Cmd.none )

        AddTimeZone ->
            case model.selectedTimeZone of
                Nothing ->
                    ( model, Cmd.none )

                Just name ->
                    ( { model
                        | selectedTimeZones = Set.insert name model.selectedTimeZones
                        , selectedTimeZone = Nothing
                      }
                    , Cmd.none
                    )

        SelectTimeZone name ->
            if name == emptySelectValue then
                ( { model | selectedTimeZone = Nothing }, Cmd.none )
            else
                ( { model | selectedTimeZone = Just name }, Cmd.none )

        RemoveTimeZone name ->
            ( { model | selectedTimeZones = Set.remove name model.selectedTimeZones }, Cmd.none )



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

        _ =
            Debug.log "isSelected" isSelected
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


getTime : DateTime.DateTime -> String -> Html.Html Msg
getTime currentTime timeZone =
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
            , Html.td [] [ Html.a [ Html.Attributes.href "#", Html.Events.onClick (RemoveTimeZone timeZone) ] [ Html.text "X" ] ]
            ]


displayTime : Set.Set String -> DateTime.DateTime -> Html.Html Msg
displayTime selectedTimeZones currentTime =
    Html.table []
        ([ Html.tr []
            [ Html.th [] [ Html.text "TimeZone" ]
            , Html.th [] [ Html.text "Time" ]
            ]
         ]
            ++ (Set.toList selectedTimeZones
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


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ title
        , addTimezoneForm model.selectedTimeZone
        , displayTime model.selectedTimeZones model.time
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
