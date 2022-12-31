Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Robot))==(Machine(Robot));
  Level(Machine(Robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Robot))==(Maze)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Robot))==(?);
  List_Includes(Machine(Robot))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Robot))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Robot))==(?);
  Context_List_Variables(Machine(Robot))==(?);
  Abstract_List_Variables(Machine(Robot))==(?);
  Local_List_Variables(Machine(Robot))==(visitedSquares,visitedRegions,status,yRobot,xRobot);
  List_Variables(Machine(Robot))==(visitedSquares,visitedRegions,status,yRobot,xRobot);
  External_List_Variables(Machine(Robot))==(visitedSquares,visitedRegions,status,yRobot,xRobot)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Robot))==(?);
  Abstract_List_VisibleVariables(Machine(Robot))==(?);
  External_List_VisibleVariables(Machine(Robot))==(?);
  Expanded_List_VisibleVariables(Machine(Robot))==(?);
  List_VisibleVariables(Machine(Robot))==(?);
  Internal_List_VisibleVariables(Machine(Robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Robot))==(btrue);
  Gluing_List_Invariant(Machine(Robot))==(btrue);
  Expanded_List_Invariant(Machine(Robot))==(btrue);
  Abstract_List_Invariant(Machine(Robot))==(btrue);
  Context_List_Invariant(Machine(Robot))==(btrue);
  List_Invariant(Machine(Robot))==(xRobot: NATURAL1 & xRobot: xRegion & yRobot: NATURAL1 & yRobot: yRegion & status: STATUS & visitedRegions: seq(maze) & visitedSquares: POW(NAT1*NAT1))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Robot))==(btrue);
  Abstract_List_Assertions(Machine(Robot))==(btrue);
  Context_List_Assertions(Machine(Robot))==(btrue);
  List_Assertions(Machine(Robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Robot))==(xRobot,yRobot,status,visitedRegions,visitedSquares:=prj1(xRegion,yRegion)(entrance),prj2(xRegion,yRegion)(entrance),no,[entrance],{});
  Context_List_Initialisation(Machine(Robot))==(skip);
  List_Initialisation(Machine(Robot))==(xRobot:=prj1(xRegion,yRegion)(entrance) || yRobot:=prj2(xRegion,yRegion)(entrance) || status:=no || visitedRegions:=[entrance] || visitedSquares:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Robot),Machine(Maze))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Robot))==(btrue);
  List_Constraints(Machine(Robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Robot))==(MoveNorth,MoveSouth,MoveEast,MoveWest,Teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute,reinitialise);
  List_Operations(Machine(Robot))==(MoveNorth,MoveSouth,MoveEast,MoveWest,Teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute,reinitialise)
END
&
THEORY ListInputX IS
  List_Input(Machine(Robot),MoveNorth)==(?);
  List_Input(Machine(Robot),MoveSouth)==(?);
  List_Input(Machine(Robot),MoveEast)==(?);
  List_Input(Machine(Robot),MoveWest)==(?);
  List_Input(Machine(Robot),Teleport)==(xTeleport,yTeleport);
  List_Input(Machine(Robot),getPosition)==(?);
  List_Input(Machine(Robot),foundExit)==(?);
  List_Input(Machine(Robot),hasVisitedSquare)==(xVisit,yVisit);
  List_Input(Machine(Robot),robotsRoute)==(?);
  List_Input(Machine(Robot),reinitialise)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Robot),MoveNorth)==(alert);
  List_Output(Machine(Robot),MoveSouth)==(alert);
  List_Output(Machine(Robot),MoveEast)==(alert);
  List_Output(Machine(Robot),MoveWest)==(alert);
  List_Output(Machine(Robot),Teleport)==(alert);
  List_Output(Machine(Robot),getPosition)==(location);
  List_Output(Machine(Robot),foundExit)==(alert);
  List_Output(Machine(Robot),hasVisitedSquare)==(square);
  List_Output(Machine(Robot),robotsRoute)==(route);
  List_Output(Machine(Robot),reinitialise)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Robot),MoveNorth)==(alert <-- MoveNorth);
  List_Header(Machine(Robot),MoveSouth)==(alert <-- MoveSouth);
  List_Header(Machine(Robot),MoveEast)==(alert <-- MoveEast);
  List_Header(Machine(Robot),MoveWest)==(alert <-- MoveWest);
  List_Header(Machine(Robot),Teleport)==(alert <-- Teleport(xTeleport,yTeleport));
  List_Header(Machine(Robot),getPosition)==(location <-- getPosition);
  List_Header(Machine(Robot),foundExit)==(alert <-- foundExit);
  List_Header(Machine(Robot),hasVisitedSquare)==(square <-- hasVisitedSquare(xVisit,yVisit));
  List_Header(Machine(Robot),robotsRoute)==(route <-- robotsRoute);
  List_Header(Machine(Robot),reinitialise)==(reinitialise)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Robot),MoveNorth)==(status/=yes);
  List_Precondition(Machine(Robot),MoveSouth)==(status/=yes);
  List_Precondition(Machine(Robot),MoveEast)==(status/=yes);
  List_Precondition(Machine(Robot),MoveWest)==(status/=yes);
  List_Precondition(Machine(Robot),Teleport)==(xTeleport: NATURAL1 & yTeleport: NATURAL1 & status/=yes);
  List_Precondition(Machine(Robot),getPosition)==(btrue);
  List_Precondition(Machine(Robot),foundExit)==(btrue);
  List_Precondition(Machine(Robot),hasVisitedSquare)==(xVisit: NATURAL1 & yVisit: NATURAL1);
  List_Precondition(Machine(Robot),robotsRoute)==(btrue);
  List_Precondition(Machine(Robot),reinitialise)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Robot),reinitialise)==(btrue | xRobot,yRobot,status,visitedRegions,visitedSquares:=prj1(xRegion,yRegion)(entrance),prj2(xRegion,yRegion)(entrance),no,[entrance],{});
  Expanded_List_Substitution(Machine(Robot),robotsRoute)==(btrue | route:=visitedRegions);
  Expanded_List_Substitution(Machine(Robot),hasVisitedSquare)==(xVisit: NATURAL1 & yVisit: NATURAL1 | xVisit|->yVisit: visitedSquares ==> square:=Visited [] not(xVisit|->yVisit: visitedSquares) ==> square:=Not_Visited);
  Expanded_List_Substitution(Machine(Robot),foundExit)==(btrue | alert:=status);
  Expanded_List_Substitution(Machine(Robot),getPosition)==(btrue | location:=xRobot|->yRobot);
  Expanded_List_Substitution(Machine(Robot),Teleport)==(xTeleport: NATURAL1 & yTeleport: NATURAL1 & status/=yes | xTeleport/:xRegion or yTeleport/:yRegion ==> alert:=Exceeding_Boundry [] not(xTeleport/:xRegion or yTeleport/:yRegion) ==> (yTeleport: ran({xTeleport}<|wall) ==> alert:=Internal_Wall [] not(yTeleport: ran({xTeleport}<|wall)) ==> (xRobot,yRobot,alert,visitedRegions,visitedSquares:=xTeleport,yTeleport,Teleported,visitedRegions<-(xTeleport|->yTeleport),visitedSquares\/{xRobot|->yRobot} || (xTeleport|->yTeleport = exit ==> status:=yes [] not(xTeleport|->yTeleport = exit) ==> status:=no))));
  Expanded_List_Substitution(Machine(Robot),MoveWest)==(status/=yes | xRobot-1/:xRegion or yRobot/:yRegion ==> alert:=Exceeding_Boundry [] not(xRobot-1/:xRegion or yRobot/:yRegion) ==> (yRobot: ran({xRobot-1}<|wall) ==> alert:=Internal_Wall [] not(yRobot: ran({xRobot-1}<|wall)) ==> (xRobot,alert,visitedRegions,visitedSquares:=xRobot-1,Moved_West,visitedRegions<-(xRobot-1|->yRobot),visitedSquares\/{xRobot|->yRobot} || (xRobot-1|->yRobot = exit ==> status:=yes [] not(xRobot-1|->yRobot = exit) ==> status:=no))));
  Expanded_List_Substitution(Machine(Robot),MoveEast)==(status/=yes | xRobot+1/:xRegion or yRobot/:yRegion ==> alert:=Exceeding_Boundry [] not(xRobot+1/:xRegion or yRobot/:yRegion) ==> (yRobot: ran({xRobot+1}<|wall) ==> alert:=Internal_Wall [] not(yRobot: ran({xRobot+1}<|wall)) ==> (xRobot,alert,visitedRegions,visitedSquares:=xRobot+1,Moved_East,visitedRegions<-(xRobot+1|->yRobot),visitedSquares\/{xRobot|->yRobot} || (xRobot+1|->yRobot = exit ==> status:=yes [] not(xRobot+1|->yRobot = exit) ==> status:=no))));
  Expanded_List_Substitution(Machine(Robot),MoveSouth)==(status/=yes | xRobot/:xRegion or yRobot-1/:yRegion ==> alert:=Exceeding_Boundry [] not(xRobot/:xRegion or yRobot-1/:yRegion) ==> (yRobot-1: ran({xRobot}<|wall) ==> alert:=Internal_Wall [] not(yRobot-1: ran({xRobot}<|wall)) ==> (yRobot,alert,visitedRegions,visitedSquares:=yRobot-1,Moved_South,visitedRegions<-(xRobot|->yRobot-1),visitedSquares\/{xRobot|->yRobot} || (xRobot|->yRobot-1 = exit ==> status:=yes [] not(xRobot|->yRobot-1 = exit) ==> status:=no))));
  Expanded_List_Substitution(Machine(Robot),MoveNorth)==(status/=yes | xRobot/:xRegion or yRobot+1/:yRegion ==> alert:=Exceeding_Boundry [] not(xRobot/:xRegion or yRobot+1/:yRegion) ==> (yRobot+1: ran({xRobot}<|wall) ==> alert:=Internal_Wall [] not(yRobot+1: ran({xRobot}<|wall)) ==> (yRobot,alert,visitedRegions,visitedSquares:=yRobot+1,Moved_North,visitedRegions<-(xRobot|->yRobot+1),visitedSquares\/{xRobot|->yRobot} || (xRobot|->yRobot+1 = exit ==> status:=yes [] not(xRobot|->yRobot+1 = exit) ==> status:=no))));
  List_Substitution(Machine(Robot),MoveNorth)==(IF xRobot/:xRegion or yRobot+1/:yRegion THEN alert:=Exceeding_Boundry ELSE IF yRobot+1: ran({xRobot}<|wall) THEN alert:=Internal_Wall ELSE yRobot:=yRobot+1 || alert:=Moved_North || visitedRegions:=visitedRegions<-(xRobot|->yRobot+1) || visitedSquares:=visitedSquares\/{xRobot|->yRobot} || IF xRobot|->yRobot+1 = exit THEN status:=yes ELSE status:=no END END END);
  List_Substitution(Machine(Robot),MoveSouth)==(IF xRobot/:xRegion or yRobot-1/:yRegion THEN alert:=Exceeding_Boundry ELSE IF yRobot-1: ran({xRobot}<|wall) THEN alert:=Internal_Wall ELSE yRobot:=yRobot-1 || alert:=Moved_South || visitedRegions:=visitedRegions<-(xRobot|->yRobot-1) || visitedSquares:=visitedSquares\/{xRobot|->yRobot} || IF xRobot|->yRobot-1 = exit THEN status:=yes ELSE status:=no END END END);
  List_Substitution(Machine(Robot),MoveEast)==(IF xRobot+1/:xRegion or yRobot/:yRegion THEN alert:=Exceeding_Boundry ELSE IF yRobot: ran({xRobot+1}<|wall) THEN alert:=Internal_Wall ELSE xRobot:=xRobot+1 || alert:=Moved_East || visitedRegions:=visitedRegions<-(xRobot+1|->yRobot) || visitedSquares:=visitedSquares\/{xRobot|->yRobot} || IF xRobot+1|->yRobot = exit THEN status:=yes ELSE status:=no END END END);
  List_Substitution(Machine(Robot),MoveWest)==(IF xRobot-1/:xRegion or yRobot/:yRegion THEN alert:=Exceeding_Boundry ELSE IF yRobot: ran({xRobot-1}<|wall) THEN alert:=Internal_Wall ELSE xRobot:=xRobot-1 || alert:=Moved_West || visitedRegions:=visitedRegions<-(xRobot-1|->yRobot) || visitedSquares:=visitedSquares\/{xRobot|->yRobot} || IF xRobot-1|->yRobot = exit THEN status:=yes ELSE status:=no END END END);
  List_Substitution(Machine(Robot),Teleport)==(IF xTeleport/:xRegion or yTeleport/:yRegion THEN alert:=Exceeding_Boundry ELSE IF yTeleport: ran({xTeleport}<|wall) THEN alert:=Internal_Wall ELSE xRobot:=xTeleport || yRobot:=yTeleport || alert:=Teleported || visitedRegions:=visitedRegions<-(xTeleport|->yTeleport) || visitedSquares:=visitedSquares\/{xRobot|->yRobot} || IF xTeleport|->yTeleport = exit THEN status:=yes ELSE status:=no END END END);
  List_Substitution(Machine(Robot),getPosition)==(location:=xRobot|->yRobot);
  List_Substitution(Machine(Robot),foundExit)==(alert:=status);
  List_Substitution(Machine(Robot),hasVisitedSquare)==(IF xVisit|->yVisit: visitedSquares THEN square:=Visited ELSE square:=Not_Visited END);
  List_Substitution(Machine(Robot),robotsRoute)==(route:=visitedRegions);
  List_Substitution(Machine(Robot),reinitialise)==(xRobot:=prj1(xRegion,yRegion)(entrance) || yRobot:=prj2(xRegion,yRegion)(entrance) || status:=no || visitedRegions:=[entrance] || visitedSquares:={})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Robot))==(entrance,exit);
  Inherited_List_Constants(Machine(Robot))==(?);
  List_Constants(Machine(Robot))==(entrance,exit)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Robot),ALERT)==({Exceeding_Boundry,Internal_Wall,Moved_North,Moved_South,Moved_East,Moved_West,Teleported});
  Context_List_Enumerated(Machine(Robot))==(?);
  Context_List_Defered(Machine(Robot))==(?);
  Context_List_Sets(Machine(Robot))==(?);
  List_Valuable_Sets(Machine(Robot))==(?);
  Inherited_List_Enumerated(Machine(Robot))==(?);
  Inherited_List_Defered(Machine(Robot))==(?);
  Inherited_List_Sets(Machine(Robot))==(?);
  List_Enumerated(Machine(Robot))==(ALERT,STATUS,SQUARE);
  List_Defered(Machine(Robot))==(?);
  List_Sets(Machine(Robot))==(ALERT,STATUS,SQUARE);
  Set_Definition(Machine(Robot),STATUS)==({no,yes});
  Set_Definition(Machine(Robot),SQUARE)==({Visited,Not_Visited})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Robot))==(?);
  Expanded_List_HiddenConstants(Machine(Robot))==(?);
  List_HiddenConstants(Machine(Robot))==(?);
  External_List_HiddenConstants(Machine(Robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Robot))==(btrue);
  Context_List_Properties(Machine(Robot))==(xRegion <: NATURAL1 & xRegion = 1..7 & yRegion <: NATURAL1 & yRegion = 1..5 & wall = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4} & maze: POW(NATURAL1*NATURAL1) & maze = xRegion*yRegion);
  Inherited_List_Properties(Machine(Robot))==(btrue);
  List_Properties(Machine(Robot))==(entrance: maze & entrance = 1|->1 & exit: maze & exit = 1|->5 & ALERT: FIN(INTEGER) & not(ALERT = {}) & STATUS: FIN(INTEGER) & not(STATUS = {}) & SQUARE: FIN(INTEGER) & not(SQUARE = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Context_List_Enumerated(Machine(Robot))==(?);
  Seen_Context_List_Invariant(Machine(Robot))==(btrue);
  Seen_Context_List_Assertions(Machine(Robot))==(btrue);
  Seen_Context_List_Properties(Machine(Robot))==(btrue);
  Seen_List_Constraints(Machine(Robot))==(btrue);
  Seen_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Expanded_List_Invariant(Machine(Robot),Machine(Maze))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Robot),MoveNorth)==(?);
  List_ANY_Var(Machine(Robot),MoveSouth)==(?);
  List_ANY_Var(Machine(Robot),MoveEast)==(?);
  List_ANY_Var(Machine(Robot),MoveWest)==(?);
  List_ANY_Var(Machine(Robot),Teleport)==(?);
  List_ANY_Var(Machine(Robot),getPosition)==(?);
  List_ANY_Var(Machine(Robot),foundExit)==(?);
  List_ANY_Var(Machine(Robot),hasVisitedSquare)==(?);
  List_ANY_Var(Machine(Robot),robotsRoute)==(?);
  List_ANY_Var(Machine(Robot),reinitialise)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Robot)) == (entrance,exit,ALERT,STATUS,SQUARE,Exceeding_Boundry,Internal_Wall,Moved_North,Moved_South,Moved_East,Moved_West,Teleported,no,yes,Visited,Not_Visited | ? | visitedSquares,visitedRegions,status,yRobot,xRobot | ? | MoveNorth,MoveSouth,MoveEast,MoveWest,Teleport,getPosition,foundExit,hasVisitedSquare,robotsRoute,reinitialise | ? | seen(Machine(Maze)) | ? | Robot);
  List_Of_HiddenCst_Ids(Machine(Robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Robot)) == (entrance,exit);
  List_Of_VisibleVar_Ids(Machine(Robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Robot)) == (?: ?);
  List_Of_Ids(Machine(Maze)) == (xRegion,yRegion,wall,maze | ? | ? | ? | ? | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (xRegion,yRegion,wall,maze);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Robot)) == (Type(ALERT) == Cst(SetOf(etype(ALERT,0,6)));Type(STATUS) == Cst(SetOf(etype(STATUS,0,1)));Type(SQUARE) == Cst(SetOf(etype(SQUARE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Robot)) == (Type(Exceeding_Boundry) == Cst(etype(ALERT,0,6));Type(Internal_Wall) == Cst(etype(ALERT,0,6));Type(Moved_North) == Cst(etype(ALERT,0,6));Type(Moved_South) == Cst(etype(ALERT,0,6));Type(Moved_East) == Cst(etype(ALERT,0,6));Type(Moved_West) == Cst(etype(ALERT,0,6));Type(Teleported) == Cst(etype(ALERT,0,6));Type(no) == Cst(etype(STATUS,0,1));Type(yes) == Cst(etype(STATUS,0,1));Type(Visited) == Cst(etype(SQUARE,0,1));Type(Not_Visited) == Cst(etype(SQUARE,0,1));Type(entrance) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(exit) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Robot)) == (Type(visitedSquares) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(visitedRegions) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(status) == Mvl(etype(STATUS,?,?));Type(yRobot) == Mvl(btype(INTEGER,?,?));Type(xRobot) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Robot)) == (Type(reinitialise) == Cst(No_type,No_type);Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(SQUARE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(foundExit) == Cst(etype(STATUS,?,?),No_type);Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(Teleport) == Cst(etype(ALERT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MoveWest) == Cst(etype(ALERT,?,?),No_type);Type(MoveEast) == Cst(etype(ALERT,?,?),No_type);Type(MoveSouth) == Cst(etype(ALERT,?,?),No_type);Type(MoveNorth) == Cst(etype(ALERT,?,?),No_type));
  Observers(Machine(Robot)) == (Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(SQUARE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(foundExit) == Cst(etype(STATUS,?,?),No_type);Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
