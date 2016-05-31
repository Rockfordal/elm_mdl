module Types exposing (..)

import Material exposing (Model)


type alias Model =
  { count : Int
  , str0 : String
  , mdl : Material.Model
  }

type alias Mdl =
  Material.Model

type Msg
  = Increase
  | Decrease
  | Reset
  | Upd0 String
  | MDL Material.Msg
