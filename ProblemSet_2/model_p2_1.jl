using JuMP, CPLEX
m = Model(with_optimizer(CPLEX.Optimizer))
@variable(m, x1 >= 0)
@variable(m, x2, Bin)
@variable(m, x3, Bin)
@variable(m, x4, Bin)
    



@objective(m, Max, 30*x1 + 12*x2 + 24*x3 + 55*x4)

@constraint(m, 30*x1 + 20*x2 + 40*x3 + 35*x4 <= 60)
@constraint(m,            x2 +  2*x3 +  x4 >= 2)
@constraint(m,    x1                         >= 0)



print(m)
status = JuMP.optimize!(m)

println("Objective value: ", JuMP.objective_value(m))
println("x1 = ", JuMP.value.(x1))
println("x2 = ", JuMP.value.(x2))
println("x3 = ", JuMP.value.(x3))
println("x4 = ", JuMP.value.(x4))
