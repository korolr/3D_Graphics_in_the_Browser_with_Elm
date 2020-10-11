module LineSegments exposing (main)

import Angle exposing (Angle)
import Camera3d
import Color
import Direction3d
import Html exposing (Html)
import Length
import Pixels
import Point3d
import Polyline3d
import Scene3d
import Scene3d.Drawable as Drawable
import Scene3d.Mesh as Mesh exposing (LineSegments, Mesh)
import Viewpoint3d


main : Html msg
main =
    let
        polyline =
            Polyline3d.fromVertices
                [ Point3d.meters 1 0 0
                , Point3d.meters 0 0 0
                , Point3d.meters 0 0 1
                , Point3d.meters 0 1 1
                ]

        mesh =
            Mesh.polyline [] polyline

        viewpoint =
            Viewpoint3d.lookAt
                { focalPoint = Point3d.origin
                , eyePoint = Point3d.meters 3 3 2
                , upDirection = Direction3d.z
                }

        camera =
            Camera3d.perspective
                { viewpoint = viewpoint
                , verticalFieldOfView = Angle.degrees 30
                , clipDepth = Length.meters 0.1
                }
    in
    Scene3d.unlit []
        { camera = camera
        , width = Pixels.pixels 800
        , height = Pixels.pixels 600
        }
        [ Drawable.colored Color.blue mesh ]
