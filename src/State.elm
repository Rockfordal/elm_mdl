module State exposing (..)

import Material exposing (model)
import Types exposing (Model, Msg(..))


-- MODEL

initialModel : Model
initialModel =
  { count = 0
  , str0 = ""
  , mdl = Material.model
      -- Boilerplate: Always use this initial MDL model store.
  }


-- ACTION, UPDATE

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


    {- Boilerplate: MDL action handler. It should always look like this. -}
    MDL action' ->
      Material.update MDL action' model
