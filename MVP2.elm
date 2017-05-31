module TimeZoneManager exposing (main)

--18
---- IMPORTATIONS
----

import Html exposing (..)
import Html.Attributes exposing (..)
import Bootstrap.Card as Card
import Bootstrap.Grid as Grid
import Html.Events exposing (onInput)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Bootstrap.Grid.Col as Col
import Bootstrap.Form.Input as Input
import Bootstrap.Dropdown as Dropdown
import Bootstrap.Button as Button
import Bootstrap.Table as Table
import Bootstrap.Form as Form
import Bootstrap.Modal as Modal
import List exposing (..)


----
---- END IMPORTATIONS
----
----
----
---- MAIN
----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , subscriptions = always Sub.none
        , init = init
        }



----
---- END MAIN
----
----
----
---- INITIALISATION
----


type alias Model =
    -- p <=> personne
    { modalState : Modal.State
    , myDrop1State : Dropdown.State
    , myDrop2State : Dropdown.State
    , id : Num
    , nb : Num
    , monh : String
    , madate : String
    , fusmoi : String
    , nommoi : String
    , fusp1 : String
    , nomp1 : String
    , fusp2 : String
    , nomp2 : String
    , fusp3 : String
    , nomp3 : String
    , fusp4 : String
    , nomp4 : String
    , fusp5 : String
    , nomp5 : String
    , fusp6 : String
    , nomp6 : String
    , fusp7 : String
    , nomp7 : String
    , fusp8 : String
    , nomp8 : String
    , fusp9 : String
    , nomp9 : String
    }


init : ( Model, Cmd Msg )
init =
    ( { modalState = Modal.hiddenState
      , myDrop1State = Dropdown.initialState
      , myDrop2State = Dropdown.initialState
      , id = P1
      , nb = P1
      , monh = "03h50"
      , madate = "23/08/2017"
      , fusmoi = "Brest"
      , nommoi = "Moi"
      , fusp1 = " "
      , nomp1 = " "
      , fusp2 = " "
      , nomp2 = " "
      , fusp3 = " "
      , nomp3 = " "
      , fusp4 = " "
      , nomp4 = " "
      , fusp5 = " "
      , nomp5 = " "
      , fusp6 = " "
      , nomp6 = " "
      , fusp7 = " "
      , nomp7 = " "
      , fusp8 = " "
      , nomp8 = " "
      , fusp9 = " "
      , nomp9 = " "
      }
    , Cmd.none
    )


type Msg
    = ModalMsg Modal.State
    | MyDrop1Msg Dropdown.State
    | MyDrop2Msg Dropdown.State
    | ID Num
    | NB Num
    | MonH String
    | MaDate String
    | MoiMsg String
    | MonNom String
    | LuiMsg String
    | NomLui String


type Num
    = P1
    | P2
    | P3
    | P4
    | P5
    | P6
    | P7
    | P8
    | P9



----
---- END INITIALISATION
----
----
----
---- UPDATE
----


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ModalMsg state ->
            ( { model | modalState = state }
            , Cmd.none
            )

        MyDrop1Msg state ->
            ( { model | myDrop1State = state }
            , Cmd.none
            )

        MyDrop2Msg state ->
            ( { model | myDrop2State = state }
            , Cmd.none
            )

        ID id ->
            ( { model | id = id }, Cmd.none )

        NB nb ->
            case nb of
                P1 ->
                    ( { model | nb = nb, id = nb, fusp2 = " ", nomp2 = " ", fusp3 = " ", nomp3 = " ", fusp4 = " ", nomp4 = " ", fusp5 = " ", nomp5 = " ", fusp6 = " ", nomp6 = " ", fusp7 = " ", nomp7 = " ", fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P2 ->
                    ( { model | nb = nb, id = nb, fusp3 = " ", nomp3 = " ", fusp4 = " ", nomp4 = " ", fusp5 = " ", nomp5 = " ", fusp6 = " ", nomp6 = " ", fusp7 = " ", nomp7 = " ", fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P3 ->
                    ( { model | nb = nb, id = nb, fusp4 = " ", nomp4 = " ", fusp5 = " ", nomp5 = " ", fusp6 = " ", nomp6 = " ", fusp7 = " ", nomp7 = " ", fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P4 ->
                    ( { model | nb = nb, id = nb, fusp5 = " ", nomp5 = " ", fusp6 = " ", nomp6 = " ", fusp7 = " ", nomp7 = " ", fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P5 ->
                    ( { model | nb = nb, id = nb, fusp6 = " ", nomp6 = " ", fusp7 = " ", nomp7 = " ", fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P6 ->
                    ( { model | nb = nb, id = nb, fusp7 = " ", nomp7 = " ", fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P7 ->
                    ( { model | nb = nb, id = nb, fusp8 = " ", nomp8 = " ", fusp9 = " ", nomp9 = " " }, Cmd.none )

                P8 ->
                    ( { model | nb = nb, id = nb, fusp9 = " ", nomp9 = " " }, Cmd.none )

                P9 ->
                    ( { model | nb = nb, id = nb }, Cmd.none )


        MonH monh ->
            ( { model | monh = monh }, Cmd.none )

        MaDate date ->
            ( { model | madate = date }, Cmd.none )

        MoiMsg fuseau ->
            ( { model | fusmoi = fuseau, myDrop1State = Dropdown.initialState }, Cmd.none )

        MonNom nommoi ->
            ( { model | nommoi = nommoi }, Cmd.none )

        LuiMsg fuseau ->
            case model.id of
                P1 ->
                    ( { model | fusp1 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P2 ->
                    ( { model | fusp2 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P3 ->
                    ( { model | fusp3 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P4 ->
                    ( { model | fusp4 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P5 ->
                    ( { model | fusp5 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P6 ->
                    ( { model | fusp6 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P7 ->
                    ( { model | fusp7 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P8 ->
                    ( { model | fusp8 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

                P9 ->
                    ( { model | fusp9 = fuseau, myDrop2State = Dropdown.initialState }, Cmd.none )

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

                P7 ->
                    ( { model | nomp7 = nomlui }, Cmd.none )

                P8 ->
                    ( { model | nomp8 = nomlui }, Cmd.none )

                P9 ->
                    ( { model | nomp9 = nomlui }, Cmd.none )



----
---- END UPDATE
----
----
----
---- RÉCUPÉRATRION D'IDENTIFIANTS
----


idToInt : Num -> Int
idToInt num =
    -- renvoie l'entier associé à un identifiant. exple: P1 -> 1
    Result.withDefault 0 (String.toInt (String.slice 1 2 (toString (num))))


idToNom : Model -> String
idToNom model =
    -- renvoie le nom associé à un identifiant. exple: P1 -> nomp1
    case model.id of
        P1 ->
            model.nomp1

        P2 ->
            model.nomp2

        P3 ->
            model.nomp3

        P4 ->
            model.nomp4

        P5 ->
            model.nomp5

        P6 ->
            model.nomp6

        P7 ->
            model.nomp7

        P8 ->
            model.nomp8

        P9 ->
            model.nomp9


idToFus : Model -> String
idToFus model =
    -- renvoie le fuseau associé à un identifiant. exple: P1 -> fusp1
    case model.id of
        P1 ->
            model.fusp1

        P2 ->
            model.fusp2

        P3 ->
            model.fusp3

        P4 ->
            model.fusp4

        P5 ->
            model.fusp5

        P6 ->
            model.fusp6

        P7 ->
            model.fusp7

        P8 ->
            model.fusp8

        P9 ->
            model.fusp9



----
---- END RÉCUPÉRATRION D'IDENTIFIANTS
----
----
----
---- GESTION COLLABORATEURS
----


espacesTexte : Int -> List (Html Msg)
espacesTexte int =
    -- astuce pour qu'il y ait bien un changement d'affichage du nom du collaborateur dans la colonne Collaborateurs lorsqu'on clique sur un autre identifiant
    if int == 1 then
        [ text " " ]
    else
        [ text " " ] ++ espacesTexte (int - 1)


viewCollaborateursBouttons : Model -> List (Html Msg)
viewCollaborateursBouttons model =
    -- affichage dans la colonne Collaborateurs du nombre juste nécessaire de boutons
    case model.nb of
        P1 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P2) ] ] [ text "+" ]
            ]

        P2 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P1) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P3) ] ] [ text "+" ]
            ]

        P3 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P2) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P4) ] ] [ text "+" ]
            ]

        P4 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P4) ] ] [ text "4" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P3) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P5) ] ] [ text "+" ]
            ]

        P5 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P4) ] ] [ text "4" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P5) ] ] [ text "5" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P4) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P6) ] ] [ text "+" ]
            ]

        P6 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P4) ] ] [ text "4" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P5) ] ] [ text "5" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P6) ] ] [ text "6" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P5) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P7) ] ] [ text "+" ]
            ]

        P7 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P4) ] ] [ text "4" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P5) ] ] [ text "5" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P6) ] ] [ text "6" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P7) ] ] [ text "7" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P6) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P8) ] ] [ text "+" ]
            ]

        P8 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P4) ] ] [ text "4" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P5) ] ] [ text "5" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P6) ] ] [ text "6" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P7) ] ] [ text "7" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P8) ] ] [ text "8" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P7) ] ] [ text "-" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P9) ] ] [ text "+" ]
            ]
            
        P9 ->
            [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P2) ] ] [ text "2" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P3) ] ] [ text "3" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P4) ] ] [ text "4" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P5) ] ] [ text "5" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P6) ] ] [ text "6" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P7) ] ] [ text "7" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P8) ] ] [ text "8" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P9) ] ] [ text "9" ]
            , Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (NB P8) ] ] [ text "-" ]
            ]


style : Model -> String -> List (Table.Cell Msg) -> Table.Row Msg
style model fus =
    -- définition de la couleur des lignes du tableau entre hier, aujourd'hui et demain
    let
        k =
            toDate (secondesbis model fus)
    in
        if (Result.withDefault 0 (String.toInt (String.slice 0 2 (k)))) /= (Result.withDefault 0 (String.toInt (String.slice 0 2 (model.madate)))) then
            if (secondesbis model fus) < (heureDateToSecondes model) then
                Table.tr [ Table.rowWarning ]
            else
                Table.tr [ Table.rowSuccess ]
        else
            Table.tr []


viewCollaborateursTableaux : Model -> String -> String -> Int -> Table.Row Msg
viewCollaborateursTableaux model nomp fus n =
    -- affichage dans le tableau des caraactéristique de chaque collaborateur
    if fus == " " && nomp == " " then
        Table.tr []
            [ Table.td [] [ text " " ]
            , Table.td [] [ text " " ]
            , Table.td [] [ text " " ]
            , Table.td [] [ text " " ]
            , Table.td [] [ text " " ]
            ]
    else if fus == " " then
        Table.tr []
            [ Table.td [] [ text (toString n) ]
            , Table.td [] [ text nomp ]
            , Table.td [] [ text " " ]
            , Table.td [] [ text " " ]
            , Table.td [] [ text " " ]
            ]
    else
        style model
            fus
            [ Table.td [] [ text (toString n) ]
            , Table.td [] [ text nomp ]
            , Table.td [] [ text fus ]
            , Table.td [] [ div [] [ text (toHoraire (secondesbis model fus)) ] ]
            , Table.td [] [ div [] [ text (toDate (secondesbis model fus)) ] ]
            ]



----
---- END GESTION COLLABORATEURS
----
----
----
---- GESTION HORAIRE/DATE/SECONDE
----
---- ALGO ET DONNEES UTILES


eltDansList : Int -> List Int -> Bool
eltDansList elt list =
    -- trouver un élément dans une liste d'entiers sachant qu'il y est
    if List.length list == 0 then
        False
    else if elt == Result.withDefault 0 (String.toInt (String.slice 5 99 (toString (head list)))) then
        True
    else
        eltDansList elt (List.drop 1 list)


lesFuseaux : List String
lesFuseaux =
    -- liste des fuseaux disponibles
    [ "Brest", "Shanghai", "New York City", "Sydney", "London", "Sao Paulo" ]


lesFuseauxRef : List Int
lesFuseauxRef =
    -- liste des décallages entre les fuseaux disponibles à partir d'un fuseau de référence
    [ 0, 6, -6, 8, -1, -5 ]


secondesDepuisLe1erJanvierMinuit1970Du1erJanvierMinuit2017 : Int
secondesDepuisLe1erJanvierMinuit1970Du1erJanvierMinuit2017 =
    -- exactement ce que ça dit, c'est utile pour la communication avec les bases de données
    1483228800


anneeBissextiles : List Int
anneeBissextiles =
    -- liste des années bisextiles depuis 1972 jusqu'à 2060
    [ 1972, 1976, 1980, 1984, 1988, 1992, 1996, 2000, 2004, 2008, 2012, 2016, 2020, 2024, 2028, 2032, 2036, 2040, 2044, 2048, 2052, 2056, 2060 ]



---- PASSAGE SECONDES EN HORAIRE/DATE


toHoraire : Int -> String
toHoraire secondes =
    -- traduit des secondes en hh:mm jj/mm/aaaa mais ne renvoie que hh:mm
    casZero (toString ((elementDeLaListe 1 (listeFinaleHoraireDate secondes)))) ++ "h" ++ casZero (toString ((elementDeLaListe 0 (listeFinaleHoraireDate secondes))))


toDate : Int -> String
toDate secondes =
    -- traduit des secondes en hh:mm jj/mm/aaaa mais ne renvoie que jj/mm/aaaa
    casZero (toString ((elementDeLaListe 2 (listeFinaleHoraireDate secondes)))) ++ "/" ++ casZero (toString ((elementDeLaListe 3 (listeFinaleHoraireDate secondes)))) ++ "/" ++ casZero (toString ((elementDeLaListe 4 (listeFinaleHoraireDate secondes))))


listeFinaleHoraireDate : Int -> List Int
listeFinaleHoraireDate secondes =
    -- list = [minutes, heure, jour, mois, annee, secondes]
    trouverMinute ([ 0 ] ++ trouverHeure ([ 0 ] ++ trouverJour ([ 1 ] ++ trouverMois (trouverAnnee [ 1970, secondes ]))))


trouverAnnee : List Int -> List Int
trouverAnnee list =
    -- list = [annee, secondes] -> list = [annee, secondes]
    if eltDansList (elementDeLaListe 0 list) anneeBissextiles then
        if (elementDeLaListe 1 list) < 366 * 24 * 3600 then
            list
        else
            trouverAnnee [ (elementDeLaListe 0 list) + 1, (elementDeLaListe 1 list) - 366 * 24 * 3600 ]
    else if (elementDeLaListe 1 list) < 365 * 24 * 3600 then
        list
    else
        trouverAnnee [ (elementDeLaListe 0 list) + 1, (elementDeLaListe 1 list) - 365 * 24 * 3600 ]


trouverMois : List Int -> List Int
trouverMois list =
    -- list = [annee, secondes] -> list = [mois, annee, secondes]
    let
        k =
            if eltDansList (elementDeLaListe 0 list) anneeBissextiles then
                1
            else
                0
    in
        if (elementDeLaListe 1 list) < 31 * 24 * 3600 then
            [ 1, (elementDeLaListe 0 list), (elementDeLaListe 1 list) ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k) * 24 * 3600 then
            [ 2, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31) * 24 * 3600 then
            [ 3, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30) * 24 * 3600 then
            [ 4, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31) * 24 * 3600 then
            [ 5, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31 + 30) * 24 * 3600 then
            [ 6, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31 + 30 + 31) * 24 * 3600 then
            [ 7, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31 + 30) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31) * 24 * 3600 then
            [ 8, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31 + 30 + 31) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31 + 30) * 24 * 3600 then
            [ 9, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31) * 24 * 3600 then
            [ 10, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31 + 30) * 24 * 3600 ]
        else if (elementDeLaListe 1 list) < (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30) * 24 * 3600 then
            [ 11, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31) * 24 * 3600 ]
        else
            [ 12, (elementDeLaListe 0 list), (elementDeLaListe 1 list) - (31 + 28 + k + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30) * 24 * 3600 ]


trouverJour : List Int -> List Int
trouverJour list =
    -- list = [jour, mois, annee, secondes]
    if (elementDeLaListe 3 list) < 3600 * 24 then
        list
    else
        trouverJour [ (elementDeLaListe 0 list) + 1, (elementDeLaListe 1 list), (elementDeLaListe 2 list), (elementDeLaListe 3 list) - 3600 * 24 ]


trouverHeure : List Int -> List Int
trouverHeure list =
    -- list = [heure, jour, mois, annee, secondes]
    if (elementDeLaListe 4 list) < 3600 then
        list
    else
        trouverHeure [ (elementDeLaListe 0 list) + 1, (elementDeLaListe 1 list), (elementDeLaListe 2 list), (elementDeLaListe 3 list), (elementDeLaListe 4 list) - 3600 ]


trouverMinute : List Int -> List Int
trouverMinute list =
    -- list = [minutes, heure, jour, mois, annee, secondes]
    if (elementDeLaListe 5 list) < 60 then
        list
    else
        trouverMinute [ (elementDeLaListe 0 list) + 1, (elementDeLaListe 1 list), (elementDeLaListe 2 list), (elementDeLaListe 3 list), (elementDeLaListe 4 list), (elementDeLaListe 5 list) - 60 ]



---- PASSAGE HORAIRE/DATE EN SECONDES


calculHeureEnSeconde : String -> Int
calculHeureEnSeconde heure =
    -- hh:mm -> secondes
    Result.withDefault 0 (String.toInt (String.slice 0 2 (heure)))
        * 3600
        + Result.withDefault 0 (String.toInt (String.slice 3 5 (heure)))
        * 60


calculAnneeEnJour : Int -> Int -> Int
calculAnneeEnJour annee1 annee2 =
    -- nombre de jours entre annee1 annee2
    let
        k =
            if eltDansList annee1 anneeBissextiles then
                1
            else
                0
    in
        if annee1 == annee2 then
            0
        else if annee1 > annee2 then
            (365 + k) + calculAnneeEnJour (annee1 - 1) annee2
        else
            -(365 + k) + calculAnneeEnJour (annee1 + 1) annee2


calculMoisEnJour : Int -> Int
calculMoisEnJour mois =
    -- nombre de jours jusqu'au mois
    if mois == 1 then
        0
    else if mois == 2 then
        31
    else if mois == 3 then
        31 + 28
    else if mois == 4 then
        31 + 28 + 31
    else if mois == 5 then
        31 + 28 + 31 + 30
    else if mois == 6 then
        31 + 28 + 31 + 30 + 31
    else if mois == 7 then
        31 + 28 + 31 + 30 + 31 + 30
    else if mois == 8 then
        31 + 28 + 31 + 30 + 31 + 30 + 31
    else if mois == 9 then
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31
    else if mois == 10 then
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30
    else if mois == 11 then
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31
    else
        31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30


etLe29Fevrier : Int -> Int -> Int
etLe29Fevrier mois annee =
    -- rajout d'un jour si on a passé février et qu'on est une annee bissextiles
    if eltDansList annee anneeBissextiles && mois > 2 then
        1
    else
        0


calculDateEnJour : String -> Int
calculDateEnJour date =
    -- calcule le nombre de jour entre 01/01/2017 et date
    Result.withDefault 0 (String.toInt (String.slice 0 2 (date)))
        - 1
        + etLe29Fevrier (Result.withDefault 0 (String.toInt (String.slice 3 5 (date)))) (Result.withDefault 0 (String.toInt (String.slice 6 10 (date))))
        + calculMoisEnJour (Result.withDefault 0 (String.toInt (String.slice 3 5 (date))))
        + calculAnneeEnJour (Result.withDefault 0 (String.toInt (String.slice 6 10 (date)))) 2017


heureDateToSecondes : Model -> Int
heureDateToSecondes model =
    -- calcule l'équivalent d'une date en secondes depuis 01/01/1970 00:00
    calculHeureEnSeconde model.monh
        + 3600
        * 24
        * calculDateEnJour model.madate
        + secondesDepuisLe1erJanvierMinuit1970Du1erJanvierMinuit2017



----
---- END GESTION HORAIRE/DATE/SECONDE
----
----
----
---- GESTION FUSEAUX
----


positionElementDansListe : String -> List String -> Int
positionElementDansListe elt list =
    -- position d'un élément dans une liste d'e chaîne de caractères
    if elt == enleverGuillemets (String.slice 5 99 (toString (head list))) then
        0
    else if List.length list == 0 then
        0
    else
        1 + positionElementDansListe elt (List.drop 1 list)


elementDeLaListe : Int -> List Int -> Int
elementDeLaListe i list =
    -- renvoie l'élement d'une liste d'entiers correspondant à la position i
    if i == 0 then
        Result.withDefault 0 (String.toInt (String.slice 5 99 (toString (head list))))
    else if List.length list == 0 then
        0
    else
        elementDeLaListe (i - 1) (List.drop 1 list)


casZero : String -> String
casZero k =
    -- rajoute un "0" pour afficher "01h30" au lieu de "1h30"
    if String.length (k) == 1 then
        "0" ++ k
    else
        k


secondesbis : Model -> String -> Int
secondesbis model fus =
    -- traduit le décalage horaire en secondes
    let
        k =
            (elementDeLaListe (positionElementDansListe fus lesFuseaux) lesFuseauxRef)
                - (elementDeLaListe (positionElementDansListe model.fusmoi lesFuseaux) lesFuseauxRef)
    in
        (heureDateToSecondes model) + k * 3600



----
---- END GESTION FUSEAUX
----
----
----
----VIEV DROPDOWN
----


creerListeDropdown : List String -> Int -> List (Dropdown.DropdownItem Msg)
creerListeDropdown list nb =
    -- créer une liste qui sera associée au dropdown nb
    if List.length list == 2 then
        [ ajouterAListeDropdown (String.slice 5 99 (toString (head list))) nb
        , ajouterAListeDropdown (String.slice 5 99 (toString (head (List.drop 1 list)))) nb
        ]
    else
        [ ajouterAListeDropdown (String.slice 5 99 (toString (head list))) nb ]
            ++ creerListeDropdown (List.drop 1 list) nb


ajouterAListeDropdown : String -> Int -> Dropdown.DropdownItem Msg
ajouterAListeDropdown str nb =
    -- ajouter un élément à la liste qui sera associée au dropdown nb
    if nb == 1 then
        Dropdown.buttonItem [ onClick (MoiMsg (enleverGuillemets str)) ] [ text (enleverGuillemets str) ]
    else
        Dropdown.buttonItem [ onClick (LuiMsg (enleverGuillemets str)) ] [ text (enleverGuillemets str) ]


enleverGuillemets : String -> String
enleverGuillemets str =
    -- si l'élément est une chaine de caractères, il faut enlever les "" dans l'affichage
    String.slice 1 (String.length str - 1) str



----
----END VIEV DROPDOWN
----
----
----
----VIEV PRINCIPAL
----


view : Model -> Html Msg
view model =
    -- visualisation de la structure principale de la page internet
    Grid.container [ class "mt-2" ] <|
        [ Grid.row []
            [ Grid.col [ Col.smAuto ]
                [ h1 [] [ text "TimeZone Manager  " ] ]
            , Grid.col []
                [ text " " ]
            , Grid.col []
                [ text " " ]
            , Grid.col [ Col.smAuto ]
                [ viewModal model ]
            , Grid.col []
                [ text " " ]
            ]
        , Grid.row []
            [ Grid.col [ Col.sm3 ]
                [ Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.headerH5 [ class "tableresp table-responsive" ] [ text model.nommoi ]
                            |> Card.block []
                                [ Card.text []
                                    (viewText11 model)
                                  -- TEXTE 1ÈRE COLONNE 1ÈRE LIGNE
                                ]
                            |> Card.view
                        ]
                    ]
                , Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.block []
                                [ Card.text []
                                    [ div [ class "tableresp table-responsive" ]
                                        (viewText12 model)
                                      -- TEXTE 1ÈRE COLONNE 2E LIGNE
                                    ]
                                ]
                            |> Card.view
                        ]
                    ]
                ]
            , Grid.col [ Col.sm3 ]
                [ Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.headerH5 [ class "tableresp table-responsive" ] [ text "Collaborateurs" ]
                            |> Card.block []
                                [ Card.text []
                                    [ div [ class "tableresp table-responsive" ]
                                        (viewText21 model)
                                      -- TEXTE 2E COLONNE 1ÈRE LIGNE
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
                                    (viewText22 model)
                                  -- TEXTE 2E COLONNE 2E LIGNE
                                ]
                            |> Card.view
                        ]
                    ]
                ]
            , Grid.col [ Col.sm6 ]
                [ Grid.row []
                    [ Grid.col []
                        [ Card.config [ Card.outlinePrimary ]
                            |> Card.headerH5 [ class "tableresp table-responsive" ] [ text "Voici le tableau" ]
                            |> Card.block []
                                [ Card.text []
                                    [ div [ class "tableresp table-responsive" ]
                                        (viewText3 model)
                                      -- TEXTE 3E COLONNE
                                    ]
                                ]
                            |> Card.view
                        ]
                    ]
                ]
            ]
        ]



----
----END VIEV PRINCIPAL
----
----
----
----VIEV CONTENUS
----


viewModal : Model -> Html Msg
viewModal model =
    div []
        [ Button.button
            [ Button.primary
            , Button.attrs [ onClick (ModalMsg Modal.visibleState) ]
            ]
            [ text "Info" ]
        , Modal.config ModalMsg
            |> Modal.small
            |> Modal.h3 [] [ text "Bonjour" ]
            |> Modal.body []
                [ p []
                    [ div [] [ text "Nous sommes une équipe de 3 étudiants de l'IMT Atlantique et nous avons réalisé ce projet dans le cadre de notre formation d'ingénieur." ]
                    , div [] [ text "Nous espérons que ce site vous sera utile pour organiser vos réunions avec vos collaborateurs en différents points du globe." ]
                    , div [] [ text "Cordialement" ]
                    , div [] [ text "." ]
                    , div [] [ text "Henri, Thomas, Yanni" ]
                    ]
                ]
            |> Modal.footer []
                [ Button.button
                    [ Button.outlinePrimary
                    , Button.attrs [ onClick (ModalMsg Modal.hiddenState) ]
                    ]
                    [ text "Close" ]
                ]
            |> Modal.view model.modalState
        ]


viewText11 : Model -> List (Html Msg)
viewText11 model =
    -- affichage de la sélection du fuseau de l'opérateur
    [ div []
        [ Dropdown.dropdown
            model.myDrop1State
            { options = []
            , toggleMsg = MyDrop1Msg
            , toggleButton =
                Dropdown.toggle [ Button.outlinePrimary, Button.small ] [ text model.fusmoi ]
            , items =
                creerListeDropdown lesFuseaux 1
            }
        ]
    ]


viewText12 : Model -> List (Html Msg)
viewText12 model =
    -- affichage de la bare de modification de l'horaire et de la date chez l'opérateur
    [ text "Horaire à consulter : "
    , div []
        [ Form.label [ for "myinput" ] []
        , Input.email [ Input.id "myinput", Input.defaultValue model.monh, Input.onInput MonH, Input.small ]
        , Form.label [ for "myinput" ] []
        , Input.email [ Input.id "myinput", Input.defaultValue model.madate, Input.onInput MaDate, Input.small ]
        , Form.help [] [ text "année entre 1970 et 2060" ]
        ]
    ]


viewText21 : Model -> List (Html Msg)
viewText21 model =
    -- affichage de la sélection des différents collaborateurs et de la barre de modification de leur nom
    [ text ("Collaborateur n° " ++ String.slice 1 2 (toString (model.id)))
    , div []
        ([ div []
            ((espacesTexte (idToInt model.id))
                ++ [ Form.label [ for "myinput" ] []
                   , Input.email [ Input.id "myinput", Input.defaultValue (idToNom model), Input.onInput NomLui, Input.small ]
                   , Form.help [] [ text "entrer le nom du collaborateur" ]
                   ]
            )
         ]
            ++ [ Button.button [ Button.small, Button.secondary, Button.attrs [ onClick (ID P1) ] ] [ text "1" ] ]
            ++ viewCollaborateursBouttons model
        )
    ]


viewText22 : Model -> List (Html Msg)
viewText22 model =
    -- affichage de la sélection du fuseau du collaborateur sélectionné au-dessus
    [ div [ class "tableresp table-responsive" ] [ text ("Fuseau n° " ++ String.slice 1 2 (toString (model.id))) ]
    , div []
        [ Dropdown.dropdown
            model.myDrop2State
            { options = []
            , toggleMsg = MyDrop2Msg
            , toggleButton =
                Dropdown.toggle [ Button.outlinePrimary, Button.small ] [ text (idToFus model) ]
            , items =
                creerListeDropdown lesFuseaux 2
            }
        ]
    ]


viewText3 : Model -> List (Html Msg)
viewText3 model =
    -- affichage du tableau récapitulatif
    [ Table.table
        { options = [ Table.bordered, Table.hover ]
        , thead =
            Table.simpleThead
                [ Table.th [] [ text " " ]
                , Table.th [] [ text model.nommoi ]
                , Table.th [] [ text model.fusmoi ]
                , Table.th [] [ text (String.slice 0 2 model.monh ++ "h" ++ String.slice 3 5 model.monh) ]
                , Table.th [] [ text model.madate ]
                ]
        , tbody =
            Table.tbody []
                [ viewCollaborateursTableaux model model.nomp1 model.fusp1 1
                , viewCollaborateursTableaux model model.nomp2 model.fusp2 2
                , viewCollaborateursTableaux model model.nomp3 model.fusp3 3
                , viewCollaborateursTableaux model model.nomp4 model.fusp4 4
                , viewCollaborateursTableaux model model.nomp5 model.fusp5 5
                , viewCollaborateursTableaux model model.nomp6 model.fusp6 6
                , viewCollaborateursTableaux model model.nomp7 model.fusp7 7
                , viewCollaborateursTableaux model model.nomp8 model.fusp8 8
                , viewCollaborateursTableaux model model.nomp9 model.fusp9 9
                ]
        }
    ]

