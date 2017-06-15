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
    | RemoveTimeZone String


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



-- List


displaySelectedTimeZone : String -> Html.Html Msg
displaySelectedTimeZone name =
    Html.li []
        [ Html.text name
        , Html.button [ Html.Events.onClick (RemoveTimeZone name) ] [ Html.text "X" ]
        ]


displaySelectedTimeZones : Set.Set String -> Html.Html Msg
displaySelectedTimeZones selectedTimeZones =
    Set.toList selectedTimeZones
        |> List.map displaySelectedTimeZone
        |> Html.ul []



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
        Html.option [ Html.Attributes.selected isSelected ] [ Html.text value ]


buildTimeZonesOptions : Maybe String -> List (Html.Html Msg)
buildTimeZonesOptions selectedTimeZone =
    Dict.keys TimeZones.all
        |> List.map (timeZoneOption selectedTimeZone)


addTimezoneForm : Html.Html Msg
addTimezoneForm =
    let
        emptySelected =
            case model.selectedTimeZone of
                Nothing ->
                    True

                Just _ ->
                    False
    in
        Html.div []
            [ Html.select
                [ Html.Events.onInput SelectTimeZone
                ]
                ([ Html.option [ Html.Attributes.selected emptySelected ] [ Html.text emptySelectValue ] ]
                    ++ buildTimeZonesOptions model.selectedTimeZone
                )
            , Html.button [ Html.Events.onClick AddTimeZone ] [ Html.text "Add" ]
            ]


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ title
        , displaySelectedTimeZones model.selectedTimeZones
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
