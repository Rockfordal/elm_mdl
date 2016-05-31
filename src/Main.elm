import Html.App as App
import Platform.Cmd exposing (Cmd)

import State exposing (initialModel, update)
import View exposing (view)


main : Program Never
main =
  App.program
    { init = ( initialModel, Cmd.none )
    , view = view
    , subscriptions = always Sub.none
    , update = update
    }
