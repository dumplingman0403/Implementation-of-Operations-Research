
set J:= {1..6};
param demand{J}>=0; #number of demand in month i
var X{J}>=0 integer; #number of products maunfacturing in regular time in month i 
var Y{J}>=0 integer; #number of products maunfacturing in overtime in month i
var Hi{J}>=0 integer; #number of employees hired in month i
var Fi{J}>=0 integer; #number of employees fired in month i
var Work{J}>=0 integer; #number of workers in month i;
var Sub{J}>=0 integer;  #number of units subcontract in month i;
var Back{J}>=0 integer;  #number of units backlog in month i;
var Inv{J}>=0 integer; #number of inventory at the end of month i;
param cst{1..10}>0; #cost catalog 
param maxovt>=0; #overtime limit
param orginv>=0; #initial inventory
param orgwrkr>0; #number of initial workers

#objective function
maximize z: sum{i in J} (cst[10]*demand[i]-(cst[2]*Hi[i] + cst[8]*Fi[i] + (cst[1]+cst[6]*cst[9])*X[i] + (cst[1]+cst[7]*cst[9])*Y[i] + cst[4]*Sub[i] + cst[5]*Inv[i] + cst[3]*Back[i]));
#constraints
#inventory and backlog balance equation constraint
s.t. Constraint1: (Inv[1] = X[1]+Y[1]-demand[1]+Sub[1]+Back[1]+orginv); 
s.t. Constraint2{k in 2..6}:(Inv[k] == - demand[k] + X[k] + Y[k] + Sub[k] + Back[k] - Back[k-1] + Inv[k-1]);
#last inventory constraint
s.t. Constraint3: Inv[6]=500;
#last backlog constraint
s.t. Constraint4: Back[6]=0; 

#workforce balance equation 
s.t. Constraint5:Work[1]-Hi[1]+Fi[1] == orgwrkr; #orgwrkr = initial workforce
s.t. Constraint6{q in 2..6}:Work[q]-Hi[q]+Fi[q]-Work[q-1] == 0;
#production capacity
s.t. Constraint7{w in J}:X[w] - (20*8/cst[9])*Work[w] == 0;
s.t. Constraint8{g in J}:Y[g] - (maxovt/cst[9])*Work[g] <= 0; #maxovt = overtime limit 



