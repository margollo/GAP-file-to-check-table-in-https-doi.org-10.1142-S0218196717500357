# Read this file into GAP 4.8.3 (or newer) with a functioning package "HeLP".
# "CheckTable();" feeds the data given in Table 9 of the article "On the Prime Graph Question for Integral Group Rings of 4-primary groups I"  (arXiv:1601.05689 [math.RT])
#   into the GAP-package HeLP (3.0 or newer) to verify the claims made in that table.  Note however that some of the groups are
#   missing, see the comments in the definition of the variable "list" below
# With "DetermineMissingEdges();" a function can be called that prints the missing edges of the Prime Graphs of the groups listed in the variable "list" below

LoadPackage("help");
non_trivial_solutions := [ ];

# List of cases that need to be checked.  How to read this list:
# First entry is always the name of the group, the following lists specify which orders are checked in which way.  Let L be such a list.
# There are three different kinds of such lists:
#   * L = [k, [r1, ... rs]]: check elements of order k with the characters r1, ... rs of the ordinary character table
#   * L = [k, p	, [r1, ... rs]]: check elements of order k with the characters r1, ... rs of the Brauer table mod p
#   * L = [[p, q], [r1, ... rs]]: check elements of order p*q with the p-constant characters r1, ... rs of the ordinary character table


list := [
# "S7", "A7", "S8", "A8", "S9", "A9", "S10", "A10" are missing
[ "L2(16).4", [2, [2]], [[17, 2], [7]], [[17, 3], [7]], [[17, 5], [7]] ],
[ "L2(16).2" ],
[ "L2(16)", [5, 2, [2]], [2*3, [2, 11]], [2*5, [12]] ],
# L2(25).2^2", "L2(25).2_3", "L2(25).2_2", "L2(25).2_1", "L2(25)" are missing
[ "L2(27).6", [3, [2]], [3*7, [7]], [[13, 3], [7]], [[13, 7], [7]] ],
[ "L2(27).3", [[13, 2], [4]] ],
[ "L2(27).2", [2, [2]], [2*3, [2, 3, 4]] ],
[ "L2(27)", [3, [2]], [2*3, [2, 4]] ],
# "L2(49).2^2", "L2(49).2_3", "L2(49).2_2", "L2(49).2_1", "L2(49)" are missing
[ "L2(81).(2x4)", [3*5, [13, 33]], [[41, 3], [9]], [[41, 5], [9]] ],
[ "L2(81).4_2", [2, [2]], [3*5, [7, 20]] ],
# for "L2(81).4_2" order 2*41 is missing
[ "L2(81).4_1", [2, [2, 28]], [3, [5, 9]], [[41, 2], [5]], [3*5, [5, 9, 32]] ],
[ "L2(81).2^2", [5, [35]], [3*5, [5, 35]] ],
[ "L2(81).2_3", [5, [18]], [2*3, [3, 32]] ],
# for "L2(81).2_3" order 2*41 is missing, for order 5 not the optimal result is achieved, see Lemma 4.2
[ "L2(81).2_2", [2, [2]], [5, [48]], [2*3, [2, 3, 52]], [3*5, [3, 48]] ],
[ "L2(81).2_1" ],
[ "L2(81)", [3, [2, 3]], [2*3, [2, 3, 28]] ],
# "PGL(2,243)", "PSL(2,243)" are missing
# "PGL(2,p)", "PSL(2,p)" are missing
# "PSL(2,2^f)" is missing
# "PGL(2,3^f)", "PSL(2,3^f)" are missing
[ "L3(4).D12", [5*7, [7]] ],
[ "L3(4).3.2_3", [2, [2]], [2*7, [2, 4]] ],
[ "L3(4).3.2_2", [2, [2]], [2*5, [2, 7]] ],
[ "L3(4).6", [2, [2]], [2*5, [2, 13]], [2*7, [2, 7]] ],
[ "L3(4).3" ],
[ "L3(4).2_3", [[5, 3], [3]], [3*7, [3, 5]] ],
[ "L3(4).2_2", [3*5, [3]], [[7, 3], [3, 5]] ],
[ "L3(4).2_1", [3*5, [3]], [3*7, [3, 5]] ],
[ "L3(4)", [2*3, [3, 6]] ],
[ "L3(5).2", [2, [2]], [5, [3, 8]], [[31, 2], [3]], [3*5, [3, 8, 13]], [[31, 3], [3]], [[31, 5], [3]] ],
[ "L3(5)", [5, [2, 6]], [3*5, [2, 6, 16]] ],
[ "L3(7).S3", [2, [2]], [7, [4, 12]], [[19, 2], [4]], [[19, 7], [4]] ],
[ "L3(7).3" ],
[ "L3(7).2", [7, 3, [3, 7, 9]], [3*7, [3, 7, 9, 10]], [[19, 3], [7]] ],
[ "L3(7)", [7, 3, [2, 4, 5, 6]], [3*7, [2, 4, 5, 6, 7]] ],
[ "L3(8).6", [2, [2]], [3, [2]], [7, 2, [4, 6, 7, 10]], [[73, 2], [7]], [[73, 3], [7]], [[73, 7], [7]] ],
[ "L3(8).3" ],
[ "L3(8).2" ],
[ "L3(8)", [2*3, [2, 9]] ],
# "L3(17).2", "L3(17)" are missing
[ "L4(3).2^2", [3, [5, 9]], [3*5, [5, 9, 16]], [[13, 3], [5, 11, 16]], [[13, 5], [5]] ],
[ "L4(3).2_3", [2, 3, [2, 3]], [[13, 2], [2, 3, 4]] ],
[ "L4(3).2_2", [2, 3, [2, 3, 4, 6, 7, 8]], [[13, 2], [4, 7]] ],
[ "L4(3).2_1" ],
[ "L4(3)" ],
[ "U3(4).4", [2, [2]], [5, 2, [2, 3]], [2*13, [5]], [3*13, [5]], [5*13, [9]] ],
[ "U3(4).2" ],
[ "U3(4)", [2*3, [7]] ],
[ "U3(5).S3", [2, [2]], [5, [4, 10]], [2*7, [2, 4]], [5*7, [4]] ],
[ "U3(5).3" ],
[ "U3(5).2", [5, [3, 7, 9]], [3*5, [3, 7, 9]], [3*7, [7]] ],
[ "U3(5)" ],
[ "U3(7).2", [2, [2]], [7, [3, 10]], [[43, 2], [3]], [3*7, [3, 10, 29]], [[43, 3], [3]], [[43, 7], [3]] ],
[ "U3(7)", [7, [2, 10]], [3*7, [2, 10, 25]] ],
# "U3(8).(3xS3)", "U3(8).3^2" are missing
[ "U3(8).S3" ],
[ "U3(8).6", [3, 2,  [2, 4, 6, 7]], [3*19, [7, 16]] ],
[ "U3(8).3_3" ],
[ "U3(8).3_2" ],
[ "U3(8).3_1" ],
[ "U3(8).2" ],
[ "U3(8)" ],
[ "U3(9).4", [2, [2]], [3, [5]], [5, 3,  [5, 7]], [[73, 2], [5]], [[73, 3], [5, 15]], [[73, 5], [5]] ],
[ "U3(9).2" ],
[ "U3(9)" ],
[ "U4(3).D8", [3, 2, [2, 3, 5]], [3*5, [6, 11, 41]], [3*7, [6, 11, 41]], [5*7, [6]] ],
[ "U4(3).4" ],
[ "U4(3).(2^2)_{133}" ],
[ "U4(3).(2^2)_{122}" ],
[ "U4(3).2_3", [2, [2]], [2*7, [2, 3]] ],
[ "U4(3).2_2", [2, 3, [2, 3 ,4]], [2*7, [2, 3, 9]] ],
[ "U4(3).2_1" ],
[ "U4(3)", [2*5, [3]] ],
[ "U5(2).2", [2, [2, 3]], [3, 2, [2, 3, 4, 6]], [2*11, [2, 3, 11]], [3*11, [5, 8]], [5*11, [3]] ],
[ "U5(2)", [2, [2]], [2*5, [2, 6]] ],
[ "S4(4).4", [2, [2, 5]], [5, 2, [2, 3]], [2*17, [2, 5, 9]], [3*17, [5]], [5*17, [5]] ],
[ "S4(4).2" ],
[ "S4(4)" ],
[ "S4(5).2", [3, 5, [3]], [5, [3, 4, 8, 23]], [[13, 3], [3]], [[13, 5], [3, 13]] ],
[ "S4(5)", [2, 5, [2]], [[13, 2], [2]] ],
# "S4(7).2", "S4(7)" are missing
[ "S4(9).2^2", [3, [5, 7, 11]], [5, [5, 7, 25]], [[41, 3], [5, 7]], [[41, 5], [21]] ],
[ "S4(9).2_3", [2, [3]], [[41, 2], [3, 4]] ],
[ "S4(9).2_2" ],
[ "S4(9).2_1", [2, [2, 3, 4, 5, 6]], [[41, 2], [3, 4, 7]] ],
[ "S4(9)" ],
[ "S6(2)", [2, [2, 3, 4]], [3, 2, [2, 3, 4]], [2*7, [2, 4, 7]], [3*7, [2, 3]], [5*7, [2]] ],
[ "O8+(2).3.2", [5*7, [4]] ],
[ "O8+(2).3", [2, [4, 8]], [2*7, [4, 7]] ],
[ "O8+(2).2", [3, 2, [2, 3, 4, 5]], [3*7, [3, 5, 7, 10]] ],
[ "O8+(2)" ],
[ "Sz(8)", [7, 2, [2]], [2*5, [4]], [[7, 2], [4]], [[13, 2], [2]], [[7, 5], [2]], [[13, 5], [2]], [[13, 7], [2]] ],
[ "Sz(32).5", [5, [2]], [41, 2, [6]], [[31, 2], [6, 18]], [[41, 2], [6]], [[31, 5], [6]], [[41, 5], [6]], [[31, 41], [6]] ],
[ "Sz(32)", [2*5, [2]] ],
[ "G2(3).2", [2, [2]], [3, 7, [3, 5, 9, 11, 14]], [2*13, [14, 20]], [3*7, 13, [3, 5, 9, 11, 16, 20]], [3*13, [3, 5, 11]], [7*13, [3]] ],
[ "G2(3)", [2*7, [2, 3]] ],
[ "3D4(2).3", [2, [7]], [3, 2, [2, 4, 5, 6]], [7, 2, [4, 5]], [2*13, [4, 10]], [3*13, [2, 4, 5]], [7*13, [7]] ],
[ "3D4(2)" ],
[ "2F4(2)'.2", [2, [3]], [2*13, [8, 10]], [3*5, [4]], [3*13, [4]], [5*13, [4]] ],
[ "2F4(2)'" ],
# "M11", "M12.2", "M12", "J2.2", "J2" are missing
];

DetermineMissingEdges := function( )
# determines which edges are not present in the Prime Graphs of the groups given in "list"
local C, o, op, case;
for case in list do
  C := CharacterTable(case[1]);
  o := DuplicateFreeList(OrdersClassRepresentatives(C));
  op := Filtered(o, x -> IsPrime(x));
  Print(case[1], ": ", Filtered(Combinations(op, 2), y -> not Product(y) in o),
"\n");
od;
end;

CheckTable := function( )
# runs the HeLP-method with the data given in "list"
local C, x, w, case, j;
SetInfoLevel(HeLP_Info, 0);
for case in list do
  C := CharacterTable(case[1]);
  Print(case[1], ": ");
  for j in [2..Size(case)] do
   x := case[j];
    if IsInt(x[1]) then
      if IsInt(x[2]) then     # third argument is list of positions of Brauer characters modulo x[2]
        w := HeLP_WithGivenOrder(Irr(C mod x[2]){x[3]}, x[1]);
      elif IsList(x[2]) then    # second argument is list of positions of characters
        w := HeLP_WithGivenOrder(Irr(C){x[2]}, x[1]);
      else
        Error("Don't know what to do.");
      fi;
      if IsPrime(x[1]) and Size(w) <>
          Size(Filtered(OrdersClassRepresentatives(C), y -> y = x[1]))  then
          # there are non-trivial solutions of elements of prime order
        Add(non_trivial_solutions, [case[1], x[1], Size(w) - Size(Filtered(OrdersClassRepresentatives(C), y -> y = x[1]))]);
        Print(x[1], " ");
      elif not IsPrime(x[1]) and w <> [] then
          # there are non-trivial solutions of elements of composite order
        Add(non_trivial_solutions, [case[1], x[1], Size(w)]);
        Print(x[1], " ");
      fi;
    elif IsList(x[1]) then
      w := HeLP_WithGivenOrderSConstant(Irr(C){x[2]}, x[1][1], x[1][2]);
      if w <> []  then         # there are non-trivial solutions
        Add(non_trivial_solutions, [case[1], x[1], Size(w)]);
        Print(x[1], " ");
      fi;
    fi;
  od;
  Print("\n");
od;
Print(non_trivial_solutions, "\n");
SetInfoLevel(HeLP_Info, 1);
end;
