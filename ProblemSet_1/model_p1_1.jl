using JuMP, CPLEX

m = Model(CPLEX.Optimizer)


@variable(m, x[1:10], Bin)

@objective(m, Min, sum(x[1:10]))

@constraint(m, x[2] >= 1)              #(district 1)
@constraint(m, x[1] + x[2] >= 1)       #(district 2)
@constraint(m, x[1] + x[3] >= 1)       #(district 3)
@constraint(m, x[3] >= 1)              #(district 4)
@constraint(m, x[3] >= 1)              #(district 5)
@constraint(m, x[2] >= 1)              #(district 6)
@constraint(m, x[2] + x[4] >= 1)       #(district 7)
@constraint(m, x[3] + x[4] >= 1)       #(district 8)
@constraint(m, x[8] >= 1)              #(district 9)
@constraint(m, x[4] + x[6] >= 1)       #(district 10)
@constraint(m, x[4] + x[5] >= 1)       #(district 11)
@constraint(m, x[4] + x[5] + x[6] >= 1)  #(district 12)
@constraint(m, x[4] + x[5] + x[7] >= 1)  #(district 13)
@constraint(m, x[8] + x[9] >= 1)       #(district 14)
@constraint(m, x[6] + x[9] >= 1)       #(district 15)
@constraint(m, x[5] + x[6] >= 1)       #(district 16)
@constraint(m, x[5] + x[7] + x[10] >= 1) #(district 17)
@constraint(m, x[8] + x[9] >= 1)       #(district 18)
@constraint(m, x[9] + x[10] >= 1)      #(district 19)
@constraint(m, x[10] >= 1)             #(district 20)

print(m)
status = JuMP.optimize!(m)

println("Objective value: ", JuMP.objective_value(m))
println("x = ", JuMP.value.(x))
