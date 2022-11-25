/* Maze
 * Author: Valan Baptist Mathuranayagam
 * Creation date: 19/11/2022
 */
MACHINE
    Maze

CONCRETE_CONSTANTS
    xRegion ,
    yRegion ,
    wall ,
    maze

PROPERTIES
    xRegion <: NATURAL1 & xRegion =  1 .. 7  &
    yRegion <: NATURAL1 & yRegion =  1 .. 5  &
    wall = { ( 1 |-> 3 ) , ( 2 |-> 1 ) , ( 2 |-> 3 ) , ( 2 |-> 5 ) , ( 3 |-> 3 ) , ( 4 |-> 2 ) , ( 4 |-> 3 ) , ( 4 |-> 4 ) , ( 6 |-> 1 ) , ( 6 |-> 2 ) , ( 6 |-> 4 ) , ( 7 |-> 4 ) } &
    maze : POW ( NATURAL1 * NATURAL1 ) & maze = xRegion * yRegion




END
