using JuMP, CPLEX
m = Model(CPLEX.Optimizer)

c_score = [80 65 83 77;   #compatible score
           54 87 61 66;
           92 45 53 59;
           70 61 81 76]


n = 4

@variable(m, x[1:n, 1:n], Bin) #Binary

@objective(m, Max, sum(c_score[i, j] * x[i, j] for i = 1:n, j = 1:n))

@constraint(m, sum(x[1,j] for  j = 1:n ) == 1)
@constraint(m, sum(x[2,j] for j = 1:n ) == 1)
@constraint(m, sum(x[3,j] for j = 1:n ) == 1)
@constraint(m, sum(x[4,j] for j = 1:n ) == 1)

@constraint(m, sum(x[i,1] for i = 1:n ) == 1)
@constraint(m, sum(x[i,2] for i = 1:n ) == 1)
@constraint(m, sum(x[i,3] for i = 1:n ) == 1)
@constraint(m, sum(x[i,4] for i = 1:n ) == 1)

print(m)
status = JuMP.optimize!(m)

println("Objective value: ", JuMP.objective_value(m))
println("x = ", JuMP.value.(x))
