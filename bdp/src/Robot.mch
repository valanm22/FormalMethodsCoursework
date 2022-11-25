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















OPERATIONS

    alert <--  MoveNorth =
    PRE
        1 /= 0
    THEN
        IF ( ( xRobot /: xRegion or yRobot + 1 /: yRegion ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            yRobot := yRobot + 1
        END
    END
END
