using JuMP, CPLEX
m = Model(with_optimizer(CPLEX.Optimizer))

@variable(m, x[1:2]>=0)

@objective(m, Max, 8*x[1] + 11*x[2])

@constraint(m, x[1] + x[2] <= 2)
@constraint(m, x[1] + x[2] >= 3)

print(m)
status = JuMP.optimize!(m)

println("Objective value = ", JuMP.objective_value(m))
println("x = ", JuMP.value.(x))
