import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { name : String
  , city : String
  , country : String
  }


model : Model
model =
  Model "" "" ""


-- UPDATE

type Msg
    = Name String
    | City String
    | Country String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    City city ->
      { model | city = city }

    Country country ->
      { model | country = country }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [
      div [ ] [ text "Welcome to Timezone Manager !" ]
    , input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "text", placeholder "City", onInput City ] []
    , input [ type_ "text", placeholder "Country", onInput Country ] []
    ]


