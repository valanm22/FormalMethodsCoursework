/* Robot
 * Author: Valan Baptist Mathuranayagam
 * Creation date: 19/11/2022
 */
MACHINE
    Robot

SEES Maze
    
SETS            
    ALERT = { 
        Exceeding_Boundry, 
        Internal_Wall,  
        Moved_North, 
        Moved_South, 
        Moved_East, 
        Moved_West,
        Teleported
    };
    
    STATUS = {
        no,
        yes
    }
    
CONSTANTS       
    entrance,
    exit
    
PROPERTIES     
    entrance : maze &  entrance = (1 |-> 1) &
    exit : maze &  exit = (1 |-> 5)
    
VARIABLES
    xRobot,
    yRobot,
    status,
    visitedRegions
    
INVARIANT
    xRobot : NATURAL1 & xRobot : xRegion &
    yRobot : NATURAL1 & yRobot : yRegion &
    status : STATUS &
    visitedRegions : seq(maze)
    
INITIALISATION
    xRobot := prj1(xRegion, yRegion) (entrance) ||
    yRobot := prj2(xRegion, yRegion) (entrance) ||
    status := no ||
    visitedRegions := [entrance]
    
DEFINITIONS
    ANIMATION_FUNCTION == ({ row, col, img | col:xRegion & 
    row: yRegion & img=0 & (col, 6-row) /: wall });
    ANIMATION_FUNCTION1 == ({ row, col, img | col: xRegion & 
    row: yRegion  & img=1 & (col, 6-row) : wall });
    ANIMATION_FUNCTION2 == ({ row, col, img | col: xRegion & 
    row: yRegion & img=2 & col=xRobot & row=(6-yRobot) });

    ANIMATION_IMG0 == "images/cell.gif";
    ANIMATION_IMG1 == "images/wall.gif";
    ANIMATION_IMG2 == "images/robot.gif";
    
    strikes_boundry(x, y) == (x /: xRegion or y /: yRegion);
    hits_wall(x, y) == (y : ran({x} <| wall));
    is_exit(x, y) == ((x |-> y) = exit)
    
OPERATIONS
    
    alert <--  MoveNorth =
    PRE
        status /= yes
    THEN
        IF (strikes_boundry(xRobot, yRobot + 1))
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF (hits_wall(xRobot, yRobot + 1))
            THEN
                alert := Internal_Wall
            ELSE
                yRobot := yRobot + 1
                || alert := Moved_North 
                || visitedRegions := (visitedRegions <- (xRobot |-> yRobot + 1))
                || IF (is_exit(xRobot, yRobot + 1))
                THEN
                    status:= yes
                ELSE
                    status := no
                END
            END
        END
    END;
    
    alert <--  MoveSouth =
    PRE
        status /= yes
    THEN
        IF (strikes_boundry(xRobot, yRobot - 1))
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF (hits_wall(xRobot, yRobot - 1))
            THEN
                alert := Internal_Wall
            ELSE
                yRobot := yRobot - 1
                || alert := Moved_South
                || visitedRegions := (visitedRegions <- (xRobot |-> yRobot - 1))
                || IF (is_exit(xRobot, yRobot - 1))
                THEN
                    status:= yes
                ELSE
                    status := no
                END
            END
        END
    END;
    
    alert <--  MoveEast =
    PRE
        status /= yes
    THEN
        IF (strikes_boundry(xRobot + 1, yRobot))
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF (hits_wall(xRobot + 1, yRobot))
            THEN
                alert := Internal_Wall
            ELSE
                xRobot := xRobot + 1
                || alert := Moved_East
                || visitedRegions := (visitedRegions <- (xRobot + 1 |-> yRobot))
                || IF (is_exit(xRobot + 1, yRobot))
                THEN
                    status:= yes
                ELSE
                    status := no
                END
            END
        END
    END;
    
    alert <--  MoveWest =
    PRE
        status /= yes
    THEN
        IF (strikes_boundry(xRobot - 1, yRobot))
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF (hits_wall(xRobot - 1, yRobot))
            THEN
                alert := Internal_Wall
            ELSE
                xRobot := xRobot - 1
                || alert := Moved_West
                || visitedRegions := (visitedRegions <- (xRobot - 1 |-> yRobot))
                || IF (is_exit(xRobot - 1, yRobot))
                THEN
                    status:= yes
                ELSE
                    status := no
                END
            END
        END
    END;
    
    alert <--  Teleport(xTeleport, yTeleport) =
    PRE
        xTeleport : NATURAL1 &
        yTeleport : NATURAL1 &
        status /= yes
    THEN
        IF (strikes_boundry(xTeleport, yTeleport))
        THEN
            alert := Exceeding_Boundry
        ELSE
            IF (hits_wall(xTeleport, yTeleport))
            THEN
                alert := Internal_Wall
            ELSE
                xRobot := xTeleport
                || yRobot := yTeleport
                || alert := Teleported
                || visitedRegions := (visitedRegions <- (xTeleport |-> yTeleport))
                || IF (is_exit(xTeleport, yTeleport))
                THEN
                    status:= yes
                ELSE
                    status := no
                END
            END
        END
    END;
    
    location <-- getPosition = 
    BEGIN
        location := (xRobot |-> yRobot)
    END;
    
    alert <-- foundExit =  
    BEGIN
        alert := status
    END;
    
    route <-- robotsRoute = 
    BEGIN
        route := visitedRegions
    END;
    
    reinitialise =
    BEGIN
        xRobot := prj1(xRegion, yRegion) (entrance) ||
        yRobot := prj2(xRegion, yRegion) (entrance) ||
        status := no ||
        visitedRegions := [entrance] 
    END
    
END