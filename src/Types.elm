module Types exposing (..)

import Material exposing (Model)


type alias Model =
  { count : Int
  , str0 : String
  , mdl : Material.Model
      -- Boilerplate: mdl is the Model store for any and all MDL components you need.
  }


type Msg
  = Increase
  | Decrease
  | Reset
  | Upd0 String
  | MDL Material.Msg
      -- Boilerplate: Msg for MDL actions (ripple animations etc.).
