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
    } 
    
CONSTANTS       
    entrance,
    exit
    
PROPERTIES     
    entrance : maze &  entrance = (1 |-> 1) &
    exit : maze &  exit = (1 |-> 5)
    
VARIABLES
    xRobot,
    yRobot
    
INVARIANT
    xRobot : NATURAL1 & xRobot : xRegion &
    yRobot : NATURAL1 & yRobot : yRegion 
    
INITIALISATION
    xRobot := prj1(xRegion, yRegion) (entrance) ||
    yRobot := prj2(xRegion, yRegion) (entrance)
    
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
    hits_wall(x, y) == (y : ran({x} <| wall))
    
OPERATIONS
    
    alert <--  MoveNorth =
    PRE
        1 /= 0
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
            END
        END
    END;
    
    alert <--  MoveSouth =
    PRE
        1 /= 0
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
            END
        END
    END;
    
    alert <--  MoveEast =
    PRE
        1 /= 0
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
            END
        END
    END;
    
    alert <--  MoveWest =
    PRE
        1 /= 0
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
                || alert := Moved_East
            END
        END
    END
END
