using JuMP, CPLEX
m = Model(with_optimizer(CPLEX.Optimizer))

@variable(m, y[1:2]>=0)

@objective(m, Max, 2*y[1] - 3*y[2])

@constraint(m, y[1] - y[2] >= 8)
@constraint(m, y[1] - y[2] >= 11)

print(m)
status = JuMP.optimize!(m)

println("Objective value = ", JuMP.objective_value(m))
println("y = ", JuMP.value.(y))
