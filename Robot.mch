/* Robot
 * Author: Valan Baptist Mathuranayagam
 * Creation date: 19/11/2022
 */
MACHINE
    Robot

SEES Maze
    
VARIABLES
    xRobot,
    yRobot
    
INVARIANT
    xRobot : NATURAL1 & xRobot : xRegion &
    yRobot : NATURAL1 & yRobot : yRegion 
    
INITIALISATION
    xRobot := 1 ||
    yRobot := 1
    
DEFINITIONS
// These functions will be used to create the graph
    ANIMATION_FUNCTION == ({ row, col, img | col:xRegion & 
row: yRegion & img=0 & (col, 6-row) /: wall });
    ANIMATION_FUNCTION1 == ({ row, col, img | col: xRegion & 
row: yRegion  & img=1 & (col, 6-row) : wall });
    ANIMATION_FUNCTION2 == ({ row, col, img | col: xRegion & 
row: yRegion & img=2 & col=xRobot & row=(6-yRobot) });
// Images for animations
    ANIMATION_IMG0 == "images/cell.gif";
    ANIMATION_IMG1 == "images/wall.gif";
    ANIMATION_IMG2 == "images/robot.gif";
END
