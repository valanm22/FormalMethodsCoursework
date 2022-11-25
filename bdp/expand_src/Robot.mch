/* Robot
 * Author: Valan Baptist Mathuranayagam
 * Creation date: 19/11/2022
 */
MACHINE
    Robot

SEES Maze

SETS
    ALERT = {
        Exceeding_Boundry ,
        Internal_Wall ,
        Moved_North ,
        Moved_South ,
        Moved_East ,
        Moved_West ,
        Teleported
    }

CONCRETE_CONSTANTS
    entrance ,
    exit

PROPERTIES
    entrance : maze &  entrance = ( 1 |-> 1 ) &
    exit : maze &  exit = ( 1 |-> 5 )

ABSTRACT_VARIABLES
    xRobot ,
    yRobot

INVARIANT
    xRobot : NATURAL1 & xRobot : xRegion &
    yRobot : NATURAL1 & yRobot : yRegion

INITIALISATION
    xRobot := prj1 ( xRegion , yRegion ) ( entrance ) ||
    yRobot := prj2 ( xRegion , yRegion ) ( entrance )

DEFINITIONS
    ANIMATION_FUNCTION == ( { row , col , img | col : xRegion &
    row : yRegion & img = 0 & ( col , 6 - row ) /: wall } ) ;
    ANIMATION_FUNCTION1 == ( { row , col , img | col : xRegion &
    row : yRegion & img = 1 & ( col , 6 - row ) : wall } ) ;
    ANIMATION_FUNCTION2 == ( { row , col , img | col : xRegion &
    row : yRegion & img = 2 & col = xRobot & row = ( 6 - yRobot ) } ) ;

    ANIMATION_IMG0 == "images/cell.gif" ;
    ANIMATION_IMG1 == "images/wall.gif" ;
    ANIMATION_IMG2 == "images/robot.gif" ;

    strikes_boundry ( x , y ) == ( x /: xRegion or y /: yRegion )

OPERATIONS

    alert <--  MoveNorth =
    PRE
        1 /= 0
    THEN
        IF ( strikes_boundry ( xRobot , yRobot + 1 ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            yRobot := yRobot + 1
        END
    END
END
