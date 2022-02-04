module Window exposing (Size, getSize, resizes)

import Task exposing (succeed, andThen)
import Browser.Dom exposing (Viewport)
import Platform exposing (Task)
import Browser.Events as E

type alias Size =
  { width : Int
  , height : Int
  }

viewPortToSize: Viewport -> Task x Size
viewPortToSize viewPort =
    Task.succeed <| Size (round  viewPort.scene.width) (round  viewPort.scene.height)
      
getSize : Task x Size
getSize =
     Task.andThen viewPortToSize Browser.Dom.getViewport
    
resizes : (Size -> msg) -> Sub msg
resizes tagger =
  E.onResize (\w h -> tagger <| Size w h)
  