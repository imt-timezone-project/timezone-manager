module Main exposing (..)

import Html exposing (Html, text)
import Json.Decode as Decode
import Http


type alias TimeZone =
    { countryCode : String
    , countryName : String
    , zoneName : String
    , gmtOfsset : Int
    , timestamp : Int
    }


type alias Model =
    { status : String
    , message : String
    , zones : List TimeZone
    }


type alias Timezones =
    { status : String
    , message : String
    , zones : List TimeZone
    }


decodeTimeZone : Decode.Decoder TimeZone
decodeTimeZone =
    Decode.map5 TimeZone
        (Decode.field "countryCode" Decode.string)
        (Decode.field "countryName" Decode.string)
        (Decode.field "zoneName" Decode.string)
        (Decode.field "gmtOffset" Decode.int)
        (Decode.field "timestamp" Decode.int)


decodeTimeZones : Decode.Decoder Timezones
decodeTimeZones =
    Decode.map3 Timezones
        (Decode.field "status" Decode.string)
        (Decode.field "message" Decode.string)
        (Decode.field "zones" <| Decode.list decodeTimeZone)


type Msg
    = UpdateTimeZones (Result Http.Error Timezones)


uri : String
uri =
    "http://api.timezonedb.com/v2/list-time-zone?key=LN6172LB7WD2&format=json"


getTimeZoneLists : Cmd Msg
getTimeZoneLists =
    Http.send UpdateTimeZones <|
        Http.get uri decodeTimeZones


init : ( Model, Cmd Msg )
init =
    (Debug.log "slt") ( { status = "OK", message = "", zones = [] }, getTimeZoneLists )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateTimeZones results ->
            case results of
                Ok r ->
                    (Debug.log "Http c cool") ( { model | zones = r.zones }, Cmd.none )

                Err err ->
                    Debug.log (toString err)
                        ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.text (toString model) ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
