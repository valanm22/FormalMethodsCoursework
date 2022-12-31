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
    } ;

    STATUS = {
        no ,
        yes
    } ;

    SQUARE = {
        Visited ,
        Not_Visited
    }

CONCRETE_CONSTANTS
    entrance ,
    exit

PROPERTIES
    entrance : maze &  entrance = ( 1 |-> 1 ) &
    exit : maze &  exit = ( 1 |-> 5 )

ABSTRACT_VARIABLES
    xRobot ,
    yRobot ,
    status ,
    visitedRegions ,
    visitedSquares

INVARIANT
    xRobot : NATURAL1 & xRobot : xRegion &
    yRobot : NATURAL1 & yRobot : yRegion &
    status : STATUS &
    visitedRegions : seq ( maze ) &
    visitedSquares : POW ( NAT1 * NAT1 )

INITIALISATION
    xRobot := prj1 ( xRegion , yRegion ) ( entrance ) ||
    yRobot := prj2 ( xRegion , yRegion ) ( entrance ) ||
    status := no ||
    visitedRegions := [ entrance ] ||
    visitedSquares := {}

















OPERATIONS

    alert <--  MoveNorth =
    PRE
        status /= yes
    THEN
        IF ( ( xRobot /: xRegion or yRobot + 1 /: yRegion ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF ( ( yRobot + 1 : ran ( { xRobot } <| wall ) ) )
            THEN
                alert := Internal_Wall
            ELSE
                yRobot := yRobot + 1
                || alert := Moved_North
                || visitedRegions := ( visitedRegions <- ( xRobot |-> yRobot + 1 ) )
                || visitedSquares := visitedSquares \/ { ( xRobot |-> yRobot ) }
                || IF ( ( ( xRobot |-> yRobot + 1 ) = exit ) )
                THEN
                    status := yes
                ELSE
                    status := no
                END
            END
        END
    END ;

    alert <--  MoveSouth =
    PRE
        status /= yes
    THEN
        IF ( ( xRobot /: xRegion or yRobot - 1 /: yRegion ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF ( ( yRobot - 1 : ran ( { xRobot } <| wall ) ) )
            THEN
                alert := Internal_Wall
            ELSE
                yRobot := yRobot - 1
                || alert := Moved_South
                || visitedRegions := ( visitedRegions <- ( xRobot |-> yRobot - 1 ) )
                || visitedSquares := visitedSquares \/ { ( xRobot |-> yRobot ) }
                || IF ( ( ( xRobot |-> yRobot - 1 ) = exit ) )
                THEN
                    status := yes
                ELSE
                    status := no
                END
            END
        END
    END ;

    alert <--  MoveEast =
    PRE
        status /= yes
    THEN
        IF ( ( xRobot + 1 /: xRegion or yRobot /: yRegion ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF ( ( yRobot : ran ( { xRobot + 1 } <| wall ) ) )
            THEN
                alert := Internal_Wall
            ELSE
                xRobot := xRobot + 1
                || alert := Moved_East
                || visitedRegions := ( visitedRegions <- ( xRobot + 1 |-> yRobot ) )
                || visitedSquares := visitedSquares \/ { ( xRobot |-> yRobot ) }
                || IF ( ( ( xRobot + 1 |-> yRobot ) = exit ) )
                THEN
                    status := yes
                ELSE
                    status := no
                END
            END
        END
    END ;

    alert <--  MoveWest =
    PRE
        status /= yes
    THEN
        IF ( ( xRobot - 1 /: xRegion or yRobot /: yRegion ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF ( ( yRobot : ran ( { xRobot - 1 } <| wall ) ) )
            THEN
                alert := Internal_Wall
            ELSE
                xRobot := xRobot - 1
                || alert := Moved_West
                || visitedRegions := ( visitedRegions <- ( xRobot - 1 |-> yRobot ) )
                || visitedSquares := visitedSquares \/ { ( xRobot |-> yRobot ) }
                || IF ( ( ( xRobot - 1 |-> yRobot ) = exit ) )
                THEN
                    status := yes
                ELSE
                    status := no
                END
            END
        END
    END ;

    alert <--  Teleport ( xTeleport , yTeleport ) =
    PRE
        xTeleport : NATURAL1 &
        yTeleport : NATURAL1 &
        status /= yes
    THEN
        IF ( ( xTeleport /: xRegion or yTeleport /: yRegion ) )
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF ( ( yTeleport : ran ( { xTeleport } <| wall ) ) )
            THEN
                alert := Internal_Wall
            ELSE
                xRobot := xTeleport
                || yRobot := yTeleport
                || alert := Teleported
                || visitedRegions := ( visitedRegions <- ( xTeleport |-> yTeleport ) )
                || visitedSquares := visitedSquares \/ { ( xRobot |-> yRobot ) }
                || IF ( ( ( xTeleport |-> yTeleport ) = exit ) )
                THEN
                    status := yes
                ELSE
                    status := no
                END
            END
        END
    END ;

    location <-- getPosition =
    BEGIN
        location := ( xRobot |-> yRobot )
    END ;

    alert <-- foundExit =
    BEGIN
        alert := status
    END ;

    square <-- hasVisitedSquare ( xVisit , yVisit ) =
    PRE
        xVisit : NATURAL1 &
        yVisit : NATURAL1
    THEN
        IF ( ( xVisit |-> yVisit ) : visitedSquares )
        THEN
            square := Visited
        ELSE
            square := Not_Visited
        END
    END ;

    route <-- robotsRoute =
    BEGIN
        route := visitedRegions
    END ;

    reinitialise =
    BEGIN
        xRobot := prj1 ( xRegion , yRegion ) ( entrance ) ||
        yRobot := prj2 ( xRegion , yRegion ) ( entrance ) ||
        status := no ||
        visitedRegions := [ entrance ] ||
        visitedSquares := {}
    END

END
