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
  Local_List_Variables(Machine(Robot))==(yRobot,xRobot);
  List_Variables(Machine(Robot))==(yRobot,xRobot);
  External_List_Variables(Machine(Robot))==(yRobot,xRobot)
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
  List_Invariant(Machine(Robot))==(xRobot: NATURAL1 & xRobot: xRegion & yRobot: NATURAL1 & yRobot: yRegion)
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
  Expanded_List_Initialisation(Machine(Robot))==(xRobot,yRobot:=prj1(xRegion,yRegion)(entrance),prj2(xRegion,yRegion)(entrance));
  Context_List_Initialisation(Machine(Robot))==(skip);
  List_Initialisation(Machine(Robot))==(xRobot:=prj1(xRegion,yRegion)(entrance) || yRobot:=prj2(xRegion,yRegion)(entrance))
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
  Internal_List_Operations(Machine(Robot))==(MoveNorth);
  List_Operations(Machine(Robot))==(MoveNorth)
END
&
THEORY ListInputX IS
  List_Input(Machine(Robot),MoveNorth)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Robot),MoveNorth)==(alert)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Robot),MoveNorth)==(alert <-- MoveNorth)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Robot),MoveNorth)==(1/=0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Robot),MoveNorth)==(1/=0 | xRobot/:xRegion or yRobot+1/:yRegion ==> alert:=Exceeding_Boundry [] not(xRobot/:xRegion or yRobot+1/:yRegion) ==> yRobot:=yRobot+1);
  List_Substitution(Machine(Robot),MoveNorth)==(IF xRobot/:xRegion or yRobot+1/:yRegion THEN alert:=Exceeding_Boundry ELSE yRobot:=yRobot+1 END)
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
  List_Enumerated(Machine(Robot))==(ALERT);
  List_Defered(Machine(Robot))==(?);
  List_Sets(Machine(Robot))==(ALERT)
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
  List_Properties(Machine(Robot))==(entrance: maze & entrance = 1|->1 & exit: maze & exit = 1|->5 & ALERT: FIN(INTEGER) & not(ALERT = {}))
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
  List_ANY_Var(Machine(Robot),MoveNorth)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Robot)) == (entrance,exit,ALERT,Exceeding_Boundry,Internal_Wall,Moved_North,Moved_South,Moved_East,Moved_West,Teleported | ? | yRobot,xRobot | ? | MoveNorth | ? | seen(Machine(Maze)) | ? | Robot);
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
  Sets(Machine(Robot)) == (Type(ALERT) == Cst(SetOf(etype(ALERT,0,6))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Robot)) == (Type(Exceeding_Boundry) == Cst(etype(ALERT,0,6));Type(Internal_Wall) == Cst(etype(ALERT,0,6));Type(Moved_North) == Cst(etype(ALERT,0,6));Type(Moved_South) == Cst(etype(ALERT,0,6));Type(Moved_East) == Cst(etype(ALERT,0,6));Type(Moved_West) == Cst(etype(ALERT,0,6));Type(Teleported) == Cst(etype(ALERT,0,6));Type(entrance) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(exit) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Robot)) == (Type(yRobot) == Mvl(btype(INTEGER,?,?));Type(xRobot) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Robot)) == (Type(MoveNorth) == Cst(etype(ALERT,?,?),No_type))
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
