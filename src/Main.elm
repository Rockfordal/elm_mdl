import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Platform.Cmd exposing (Cmd)

import Material
import Material.Scheme
import Material.Button as Button
import Material.Icon as Icon
import Material.Options as Options exposing (css)
import Material.Badge as Badge
import Material.Textfield as Textfield

-- MODEL


type alias Model =
  { count : Int
  , str0 : String
  , mdl : Material.Model
      -- Boilerplate: mdl is the Model store for any and all MDL components you need.
  }


model : Model
model =
  { count = 0
  , str0 = ""
  , mdl = Material.model
      -- Boilerplate: Always use this initial MDL model store.
  }


-- ACTION, UPDATE


type Msg
  = Increase
  | Decrease
  | Reset
  | Upd0 String  
  | MDL Material.Msg
      -- Boilerplate: Msg for MDL actions (ripple animations etc.).


update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case Debug.log "" action of
    Increase ->
      ( { model | count = model.count + 1 }
      , Cmd.none
      )

    Decrease ->
      ( { model | count = model.count - 1 }
      , Cmd.none
      )

    Reset ->
      ( { model | count = 0 }
      , Cmd.none
      )

    Upd0 str ->
      ( { model | str0 = str }, Cmd.none )


    {- Boilerplate: MDL action handler. It should always look like this.
    -}
    MDL action' ->
      Material.update MDL action' model


-- VIEW


type alias Mdl =
  Material.Model


view : Model -> Html Msg
view model =
  div
    [ style [ ("padding", "2rem") ] ]
    [ Options.span
        [ Badge.add <| toString model.count ]
        [ text "Antal" ]
    {- We construct the instances of the Button component that we need, one
    for the increase button, one for the reset button. First, the increase
    button. The arguments are:
      - An instance id (the `[0]`). Every component that uses the same model
        collection (model.mdl in this file) must have a distinct instance id.  -
      - A Msg constructor (`Mdl`), lifting MDL actions to your Msg type.
      - An initial model (`(Button.model True)`---a button with a ripple animation.
    Notice that we do not have to add increase and reset separately to model.mdl,
    and we did not have to add to our update actions to handle their internal events.
    -}
    , Button.render MDL [0] model.mdl
        [ Button.fab
        , Button.onClick Increase
        , css "margin" "0 24px"
        ]
        [ Icon.i "add"]

    , Button.render MDL [1] model.mdl
        [ Button.fab
        , Button.onClick Decrease
        , css "margin" "0 24px"
        ]
        [ Icon.i "remove"]

    , Button.render MDL [2] model.mdl
        [ Button.raised
        , Button.colored
        , Button.ripple
        , Button.onClick Reset ]
        [ text "Nollställ" ]

    , Textfield.render MDL [3] model.mdl
      [ Textfield.onInput Upd0 ]

    ]

  |> Material.Scheme.top


main : Program Never
main =
  App.program
    { init = ( model, Cmd.none )
    , view = view
    , subscriptions = always Sub.none
    , update = update
    }
