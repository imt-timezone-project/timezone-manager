module Main exposing (..)

import Dict
import Html
import Html.Attributes
import Html.Events
import Set
import Time.TimeZone as TimeZone
import Time.TimeZones as TimeZones


type alias Model =
    { selectedTimeZones : Set.Set String
    , selectedTimeZone : Maybe String
    }


type Msg
    = AddTimeZone
    | SelectTimeZone String


emptySelectValue =
    "Select a timezone"



-- Model


model : Model
model =
    { selectedTimeZones = Set.empty
    , selectedTimeZone = Nothing
    }



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTimeZone ->
            case model.selectedTimeZone of
                Nothing ->
                    ( model, Cmd.none )

                Just name ->
                    ( { model | selectedTimeZones = Set.insert name model.selectedTimeZones }, Cmd.none )

        SelectTimeZone name ->
            if name == emptySelectValue then
                ( { model | selectedTimeZone = Nothing }, Cmd.none )
            else
                ( { model | selectedTimeZone = Just name }, Cmd.none )



-- Views


title : Html.Html Msg
title =
    Html.h1 [] [ Html.text "Timezone Manager" ]


timeZoneOption : String -> Html.Html Msg
timeZoneOption value =
    Html.option [] [ Html.text value ]


buildTimeZonesOptions : List (Html.Html Msg)
buildTimeZonesOptions =
    Dict.keys TimeZones.all
        |> List.map timeZoneOption


addTimezoneForm : Html.Html Msg
addTimezoneForm =
    Html.div []
        [ Html.select [ Html.Events.onInput SelectTimeZone ]
            ([ Html.option [] [ Html.text emptySelectValue ] ]
                ++ buildTimeZonesOptions
            )
        , Html.button [ Html.Events.onClick AddTimeZone ] [ Html.text "Add" ]
        ]


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ title
        , addTimezoneForm
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }
