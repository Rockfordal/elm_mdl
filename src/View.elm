module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Types exposing (Model, Msg(..))

import Material
import Material.Scheme
import Material.Button as Button
import Material.Icon as Icon
import Material.Options as Options exposing (css)
import Material.Badge as Badge
import Material.Textfield as Textfield

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

