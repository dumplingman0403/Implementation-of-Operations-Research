using JuMP, CPLEX

m = Model(CPLEX.Optimizer)
demand = [1600 3000 3200 3800 2200 2200]
# decision variables
# @variable(m, demand[1:6] >=0, Int)
@variable(m, x[1:6] >= 0, Int)
@variable(m, y[1:6] >= 0, Int)
@variable(m, H[1:6] >= 0, Int)
@variable(m, F[1:6] >= 0, Int)
@variable(m, Sub[1:6] >= 0, Int)
@variable(m, Back[1:6] >= 0, Int)
@variable(m, Inv[1:6] >= 0, Int)
@variable(m, Work[1:6] >= 0, Int)

# objective function
@objective(m, Max, 40 * sum(demand[1:6]) - (300*sum(H[1:6]) + 500*sum(F[1:6]) + 26*sum(x[1:6])
  + 34*sum(y[1:6]) + 30*sum(Sub[1:6]) + 2*sum(Inv[1:6]) + 5*sum(Back[1:6])))

@constraint(m, Back[6] == 0)
@constraint(m, Inv[6] == 500)

@constraint(m, Inv[1] == x[1] + y[1] + Sub[1] + Back[1] - 1600 + 1000)
@constraint(m, Inv[2] == x[2] + y[2] + Sub[2] + Back[2] - 3000 + Inv[1] - Back[1])
@constraint(m, Inv[3] == x[3] + y[3] + Sub[3] + Back[3] - 3200 + Inv[2] - Back[2])
@constraint(m, Inv[4] == x[4] + y[4] + Sub[4] + Back[4] - 3800 + Inv[3] - Back[3])
@constraint(m, Inv[5] == x[5] + y[5] + Sub[5] + Back[5] - 2200 + Inv[4] - Back[4])
@constraint(m, Inv[6] == x[6] + y[6] + Sub[6] + Back[6] - 2200 + Inv[5] - Back[5])

@constraint(m, Work[1] - H[1] + F[1] == 80)
@constraint(m, Work[2] - H[2] + F[2] - Work[1] == 0 )
@constraint(m, Work[3] - H[3] + F[3] - Work[2] == 0 )
@constraint(m, Work[4] - H[4] + F[4] - Work[3] == 0 )
@constraint(m, Work[5] - H[5] + F[5] - Work[4] == 0 )
@constraint(m, Work[6] - H[6] + F[6] - Work[5] == 0 )

@constraint(m, x[1] - 40*Work[1] == 0)
@constraint(m, x[2] - 40*Work[2] == 0)
@constraint(m, x[3] - 40*Work[3] == 0)
@constraint(m, x[4] - 40*Work[4] == 0)
@constraint(m, x[5] - 40*Work[5] == 0)
@constraint(m, x[6] - 40*Work[6] == 0)

@constraint(m, y[1] - 2.5*Work[1] <= 0)
@constraint(m, y[2] - 2.5*Work[2] <= 0)
@constraint(m, y[3] - 2.5*Work[3] <= 0)
@constraint(m, y[4] - 2.5*Work[4] <= 0)
@constraint(m, y[5] - 2.5*Work[5] <= 0)
@constraint(m, y[6] - 2.5*Work[6] <= 0)


print(m)
status = JuMP.optimize!(m)

println("Objective value: ", JuMP.objective_value(m))
println("x = ", JuMP.value.(x))
println("y = ", JuMP.value.(y))
println("H = ", JuMP.value.(H))
println("F = ", JuMP.value.(F))
println("Sub = ", JuMP.value.(Sub))
println("Back = ", JuMP.value.(Back))
println("Inv = ", JuMP.value.(Inv))
println("Work = ", JuMP.value.(Work))
