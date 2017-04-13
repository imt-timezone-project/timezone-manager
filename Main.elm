module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.Card as Card
import Bootstrap.Grid as Grid
import Html.Events exposing (onInput)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Bootstrap.Grid.Col as Col


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , subscriptions = always Sub.none
        , init = init
        }



-- INITIALISATION


type alias Model =
    { id : Num
    , nb : Num
    , monh : String
    , moi : String
    , p1 : String
    , nomp1 : String
    , p2 : String
    , nomp2 : String
    , p3 : String
    , nomp3 : String
    , p4 : String
    , nomp4 : String
    , p5 : String
    , nomp5 : String
    , p6 : String
    , nomp6 : String
    }


init : ( Model, Cmd Msg )
init =
    ( { id = P1, nb = P1, monh = "15h17", moi = "Paris", p1 = " ", nomp1 = " ", p2 = " ", nomp2 = " ", p3 = " ", nomp3 = " ", p4 = " ", nomp4 = " ", p5 = " ", nomp5 = " ", p6 = " ", nomp6 = " " }, Cmd.none )


type Msg
    = MoiMsg Fuseau
    | LuiMsg Fuseau
    | MonH String
    | NomLui String
    | ID Num
    | NB Num


type Num
    = P1
    | P2
    | P3
    | P4
    | P5
    | P6


type Fuseau
    = Paris
    | Beijing
    | NewYork



-- UPDATE


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        MoiMsg fuseau ->
            ( { model | moi = toString (fuseau) }, Cmd.none )

        LuiMsg fuseau ->
            case model.id of
                P1 ->
                    ( { model | p1 = toString (fuseau) }, Cmd.none )

                P2 ->
                    ( { model | p2 = toString (fuseau) }, Cmd.none )

                P3 ->
                    ( { model | p3 = toString (fuseau) }, Cmd.none )

                P4 ->
                    ( { model | p4 = toString (fuseau) }, Cmd.none )

                P5 ->
                    ( { model | p5 = toString (fuseau) }, Cmd.none )

                P6 ->
                    ( { model | p6 = toString (fuseau) }, Cmd.none )

        MonH monh ->
            ( { model | monh = monh }, Cmd.none )

        NomLui nomlui ->
            case model.id of
                P1 ->
                    ( { model | nomp1 = nomlui }, Cmd.none )

                P2 ->
                    ( { model | nomp2 = nomlui }, Cmd.none )

                P3 ->
                    ( { model | nomp3 = nomlui }, Cmd.none )

                P4 ->
                    ( { model | nomp4 = nomlui }, Cmd.none )

                P5 ->
                    ( { model | nomp5 = nomlui }, Cmd.none )

                P6 ->
                    ( { model | nomp6 = nomlui }, Cmd.none )

        ID id ->
            ( { model | id = id }, Cmd.none )

        NB nb ->
            case nb of
                P1 ->
                    ( { model | nb = nb, id = nb, p2 = " ", nomp2 = " ", p3 = " ", nomp3 = " ", p4 = " ", nomp4 = " ", p5 = " ", nomp5 = " ", p6 = " ", nomp6 = " " }, Cmd.none )

                P2 ->
                    ( { model | nb = nb, id = nb, p3 = " ", nomp3 = " ", p4 = " ", nomp4 = " ", p5 = " ", nomp5 = " ", p6 = " ", nomp6 = " " }, Cmd.none )

                P3 ->
                    ( { model | nb = nb, id = nb, p4 = " ", nomp4 = " ", p5 = " ", nomp5 = " ", p6 = " ", nomp6 = " " }, Cmd.none )

                P4 ->
                    ( { model | nb = nb, id = nb, p5 = " ", nomp5 = " ", p6 = " ", nomp6 = " " }, Cmd.none )

                P5 ->
                    ( { model | nb = nb, id = nb, p6 = " ", nomp6 = " " }, Cmd.none )

                P6 ->
                    ( { model | nb = nb, id = nb }, Cmd.none )



-- VIEW


viewnames model =
    case model.id of
        P1 ->
            div []
                [ text " "
                , input [ type_ "text", placeholder model.nomp1, onInput NomLui ] []
                ]

        P2 ->
            div []
                [ text " "
                , text " "
                , input [ type_ "text", placeholder model.nomp2, onInput NomLui ] []
                ]

        P3 ->
            div []
                [ text " "
                , text " "
                , text " "
                , input [ type_ "text", placeholder model.nomp3, onInput NomLui ] []
                ]

        P4 ->
            div []
                [ text " "
                , text " "
                , text " "
                , text " "
                , input [ type_ "text", placeholder model.nomp4, onInput NomLui ] []
                ]

        P5 ->
            div []
                [ text " "
                , text " "
                , text " "
                , input [ type_ "text", placeholder model.nomp5, onInput NomLui ] []
                ]

        P6 ->
            div []
                [ text " "
                , text " "
                , text " "
                , text " "
                , input [ type_ "text", placeholder model.nomp6, onInput NomLui ] []
                ]


viewbuttons : Model -> Html Msg
viewbuttons model =
    case model.nb of
        P1 ->
            div []
                [ text ("Nom du collaborateurs n° " ++ String.slice 1 2 (toString (model.id)))
                , viewnames model
                , button [ onClick (ID P1) ] [ text "1" ]
                , button [ onClick (NB P2) ] [ text "+" ]
                ]

        P2 ->
            div []
                [ text ("Nom du collaborateurs n° " ++ String.slice 1 2 (toString (model.id)))
                , text " "
                , viewnames model
                , button [ onClick (ID P1) ] [ text "1" ]
                , button [ onClick (ID P2) ] [ text "2" ]
                , button [ onClick (NB P1) ] [ text "-" ]
                , button [ onClick (NB P3) ] [ text "+" ]
                ]

        P3 ->
            div []
                [ text ("Nom du collaborateurs n° " ++ String.slice 1 2 (toString (model.id)))
                , viewnames model
                , button [ onClick (ID P1) ] [ text "1" ]
                , button [ onClick (ID P2) ] [ text "2" ]
                , button [ onClick (ID P3) ] [ text "3" ]
                , button [ onClick (NB P2) ] [ text "-" ]
                , button [ onClick (NB P4) ] [ text "+" ]
                ]

        P4 ->
            div []
                [ text ("Nom du collaborateurs n° " ++ String.slice 1 2 (toString (model.id)))
                , viewnames model
                , button [ onClick (ID P1) ] [ text "1" ]
                , button [ onClick (ID P2) ] [ text "2" ]
                , button [ onClick (ID P3) ] [ text "3" ]
                , button [ onClick (ID P4) ] [ text "4" ]
                , button [ onClick (NB P3) ] [ text "-" ]
                , button [ onClick (NB P5) ] [ text "+" ]
                ]

        P5 ->
            div []
                [ text ("Nom du collaborateurs n° " ++ String.slice 1 2 (toString (model.id)))
                , viewnames model
                , button [ onClick (ID P1) ] [ text "1" ]
                , button [ onClick (ID P2) ] [ text "2" ]
                , button [ onClick (ID P3) ] [ text "3" ]
                , button [ onClick (ID P4) ] [ text "4" ]
                , button [ onClick (ID P5) ] [ text "5" ]
                , button [ onClick (NB P4) ] [ text "-" ]
                , button [ onClick (NB P6) ] [ text "+" ]
                ]

        P6 ->
            div []
                [ text ("Nom du collaborateurs n° " ++ String.slice 1 2 (toString (model.id)))
                , viewnames model
                , button [ onClick (ID P1) ] [ text "1" ]
                , button [ onClick (ID P2) ] [ text "2" ]
                , button [ onClick (ID P3) ] [ text "3" ]
                , button [ onClick (ID P4) ] [ text "4" ]
                , button [ onClick (ID P5) ] [ text "5" ]
                , button [ onClick (ID P6) ] [ text "6" ]
                , button [ onClick (NB P5) ] [ text "-" ]
                ]


etape : String -> String -> String -> Int
etape moi p monh =
    let
        k =
            if moi == "Paris" then
                if p == "Paris" then
                    0
                else if p == "Beijing" then
                    6
                else
                    -6
            else if moi == "Beijing" then
                if p == "Paris" then
                    -6
                else if p == "Beijing" then
                    0
                else
                    -12
            else if p == "Paris" then
                6
            else if p == "Beijing" then
                12
            else
                0
    in
        Result.withDefault 0 (String.toInt (String.slice 0 2 monh)) + k


viewValidation : String -> String -> String -> Html Msg
viewValidation moi p monh =
    let
        k =
            if etape moi p monh > 24 then
                etape moi p monh - 24
            else if etape moi p monh < 0 then
                etape moi p monh + 24
            else
                etape moi p monh
    in
        div [] [ text (toString (k) ++ "h" ++ String.slice 3 5 monh) ]


viewPartenaire : String -> String -> String -> String -> Int -> Html Msg
viewPartenaire moi nomp p monh n =
    if p == " " && nomp == " " then
        tr []
            [ th []
                [ text " " ]
            , th []
                [ text " " ]
            , th []
                [ text " " ]
            , th []
                [ text " " ]
            ]
    else if p == " " then
        tr []
            [ th []
                [ text (toString n) ]
            , th []
                [ text nomp ]
            , th []
                [ text " " ]
            , th []
                [ text " " ]
            ]
    else
        tr []
            [ th []
                [ text (toString n) ]
            , th []
                [ text nomp ]
            , th []
                [ text p ]
            , th []
                [ viewValidation moi p monh ]
            ]


view : Model -> Html Msg
view model =
    Grid.container [ class "mt-2" ] <|
        [ h1 [] [ text "TimeZone Manager" ]
        , Grid.row []
            [ Grid.col [ Col.xs3 ]
                [ Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.headerH4 [] [ text "Moi" ]
                            |> Card.block []
                                [ Card.text [] [ text "Choisissez votre fuseau :" ]
                                , Card.text []
                                    [ div []
                                        [ button [ onClick (MoiMsg Paris) ] [ text "Paris" ]
                                        , button [ onClick (MoiMsg Beijing) ] [ text "Beijing" ]
                                        , button [ onClick (MoiMsg NewYork) ] [ text "NewYork" ]
                                        ]
                                    ]
                                ]
                            |> Card.view
                        ]
                    ]
                , Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.block []
                                [ Card.text []
                                    [ div []
                                        [ text "Horaire à consulter : "
                                        , input [ type_ "text", placeholder "15h17", onInput MonH ] []
                                        ]
                                    ]
                                ]
                            |> Card.view
                        ]
                    ]
                ]
            , Grid.col [ Col.xs3 ]
                [ Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.headerH4 [] [ text "Collaborateurs" ]
                            |> Card.block []
                                [ Card.text []
                                    [ viewbuttons model ]
                                ]
                            |> Card.view
                        ]
                    ]
                , Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.block []
                                [ Card.text [] [ text ("Fuseau du collaborateurs n° " ++ String.slice 1 2 (toString (model.id))) ]
                                , Card.text []
                                    [ div []
                                        [ button [ onClick (LuiMsg Paris) ] [ text "Paris" ]
                                        , button [ onClick (LuiMsg Beijing) ] [ text "Beijing" ]
                                        , button [ onClick (LuiMsg NewYork) ] [ text "NewYork" ]
                                        ]
                                    ]
                                ]
                            |> Card.view
                        ]
                    ]
                ]
            , Grid.col [ Col.xs6 ]
                [ Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.headerH4 [] [ text "Voici le tableau" ]
                            |> Card.block []
                                [ Card.text []
                                    [ div [ class "container" ]
                                        [ div [ class "row" ]
                                            [ div [ class "col-md-12" ]
                                                [ div []
                                                    [ div [ class "tableresp table-responsive" ]
                                                        [ table [ class "table table-bordered" ]
                                                            [ thead []
                                                                [ tr []
                                                                    [ th []
                                                                        [ text " " ]
                                                                    , th []
                                                                        [ text "Moi" ]
                                                                    , th []
                                                                        [ text model.moi ]
                                                                    , th []
                                                                        [ text (String.slice 0 2 model.monh ++ "h" ++ String.slice 3 5 model.monh) ]
                                                                    ]
                                                                ]
                                                            , tbody []
                                                                [ viewPartenaire model.moi model.nomp1 model.p1 model.monh 1
                                                                , viewPartenaire model.moi model.nomp2 model.p2 model.monh 2
                                                                , viewPartenaire model.moi model.nomp3 model.p3 model.monh 3
                                                                , viewPartenaire model.moi model.nomp4 model.p4 model.monh 4
                                                                , viewPartenaire model.moi model.nomp5 model.p5 model.monh 5
                                                                , viewPartenaire model.moi model.nomp6 model.p6 model.monh 6
                                                                ]
                                                            ]
                                                        ]
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            |> Card.view
                        ]
                    ]
                ]
            ]
        ]

