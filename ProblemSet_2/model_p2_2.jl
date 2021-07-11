using JuMP, CPLEX

m = Model(CPLEX.Optimizer)
c = [8 10 9 8 6 2 7 5] #cj
a = [4 2 7 3 5 1 3 5]  #aj
n = 8                  #number of variables
b = 23

#@variable(m, x[1:n] >= 0) #variables setting for (a)
#@variable(m, x[1:n] >= 0, Bin)
@variable(m, x[1:n]>=0, Int) #variables setting for (b)

@objective(m, Max, sum(c[j] * x[j] for j = 1:n))

@constraint(m, sum(a[j] * x[j] for j = 1:n) <= b)
#@constraint(m, x[2] == 11) #fix x2 = 11

print(m)
status = JuMP.optimize!(m)

println("Objective value: ", JuMP.objective_value(m))
println("x = ", JuMP.value.(x))
