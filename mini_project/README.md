# Mini Project

## Problem description
NYY is a winter jacket manufacturer company with manufacturing facilities in the U.S.A. Winter jacket demand is seasonal peaking in the winter as the temperatures along the East Coast dipping well below zero. Production of winter jackets requires some certain amount of work and NYY jacket manufacturer has multiple options to handle seasonal demand.
The first option is NYY can prefer to increase number of workers by adding workers during the peak season. Second option is NYY can subcontract out partial work to outside companies. Third option is NYY can build up inventory capacity to produce and store extra winter jackets during slow seasons. Fourth option is that NYY can make late order deliveries by creating backlog of orders. President of NYY wants to know how to make best use of these available options through an aggregate plan. Demand forecast for upcoming months are shown in following Table 1.

<p style="text-align: center;">Table 1: Demand Forecast for NYY Jacket Manufacturer</p>

<center>

|Month|Demand|
|-----|------|
|September |1,600|
|October |3,000|
|November |3,200|
|December |3,800|
|January |2,200|
|February |2,200|

</center>

Each winter jacket is sold for $40 through retailers and also NYY has 1,000 jackets in their inventory in September as well as 80 workers working with the company at the beginning of September. Each month consists of 20 working days and each worker works 8 hours per day straight and rest on overtime. $4 is paid to each worker regular time. Please note that production operation is not limited by the machine capacity as production operation is directly related to the number of labor hours worked. Overtime per employee per month is limited to 10 hours. Table 2 shows the related costs.<br>

<center>Table 2: Costs for Manufacturing Jacket</center>

<center>

|Item| Cost|
|----|-----|
|Material cost |$10/unit|
|Adding more workers cost | $300/worker|
|Backlogging cost | $5/unit/month |
|Subcontracting cost | $30/unit |
|Inventory cost | $2/unit/month |
|Regular time cost | $4/hour |
|Overtime cost | $6/hour |
|Layoff cost | $500/worker |
|Labor hours required | 4 hours/unit |

</center>

Keep it in mind that NYY does not have any limits on subcontracting out, backlogging, and inventories. Cost of inventory is paid at the end of inventory in the month. All stockouts are supplied from the following month’s production or previous month’s inventory. President of NYY wants to find the optimal plan that will let them stock 500 jackets in inventory and have no stockouts waiting at the end of March.


## Solution

### Decision variable
![x_1](https://latex.codecogs.com/svg.image?x_i)        = number of products manufacturing in regular time in month i. <br>
![y_i](https://latex.codecogs.com/svg.image?y_i)        = number of products manufacturing in overtime in month i. <br>
![H_i](https://latex.codecogs.com/svg.image?H_i)        = number of new workers hired in month i. <br>
![F_i](https://latex.codecogs.com/svg.image?F_i)        = number of workers fired in month i. <br>
![Sub_i](https://latex.codecogs.com/svg.image?Sub_i)    = number of unit subcontract in month i. <br>
![Work_i](https://latex.codecogs.com/svg.image?Work_i)  = number of workers in month i. <br>
![Back_i](https://latex.codecogs.com/svg.image?Back_i)  = number of unit backlog in month i. <br>
![Inv_i](https://latex.codecogs.com/svg.image?Inv_i)    = number of inventory at the end of month i. <br>

(i=1, 2, 3, 4, 5, 6; Sep=1, Oct=2, Nov=3, Dec=4, Jan=5, Feb=6) <br>

### Objective function
![objective_function](https://latex.codecogs.com/svg.image?Z\&space;=\&space;40\sum_{i=1}^{6}{demand}_i-(300\sum_{i=1}^{6}H_i&plus;500\sum_{i=1}^{6}F_i&plus;26\sum_{i=1}^{6}x_i&plus;34\sum_{i=1}^{6}y_i&plus;30\sum_{i=1}^{6}{Sub}_i&plus;2\sum_{i=1}^{6}{Inv}_i&plus;5\sum_{i=1}^{6}{Back}_i))

### Constraint
![cst1](https://latex.codecogs.com/svg.image?&space;{Inv}_1=&space;x_1&plus;y_1&plus;{Sub}_1&plus;{Back}_1-1600&plus;1000) <br>
![cst2](https://latex.codecogs.com/svg.image?{Inv}_2=&space;x_2&plus;y_2&plus;{Sub}_2&plus;{Back}_2-3000&plus;{Inv}_1-{Back}_1) <br>
![cst3](https://latex.codecogs.com/svg.image?{Inv}_3=&space;x_3&plus;y_3&plus;{Sub}_3&plus;{Back}_3-3200&plus;{Inv}_2-{Back}_2) <br>
![cst4](https://latex.codecogs.com/svg.image?{Inv}_4=&space;x_4&plus;y_4&plus;{Sub}_4&plus;{Back}_4-3800&plus;{Inv}_3-{Back}_3) <br>
![cst5](https://latex.codecogs.com/svg.image?{Inv}_5=&space;x_5&plus;y_5&plus;{Sub}_5&plus;{Back}_5-2200&plus;{Inv}_4-{Back}_4) <br>
![cst6](https://latex.codecogs.com/svg.image?{Inv}_6=&space;x_6&plus;y_6&plus;{Sub}_6&plus;{Back}_6-2200&plus;{Inv}_5-{Back}_5) <br>
![cst7](https://latex.codecogs.com/svg.image?{Back}_6=0) <br>
![cst8](https://latex.codecogs.com/svg.image?{Inv}_6=500) <br>
![cst9](https://latex.codecogs.com/svg.image?{Work}_1-H_1&plus;F_1=80) <br>
![cst10](https://latex.codecogs.com/svg.image?{Work}_2-H_2&plus;F_2-{Work}_1=0) <br>
![cst11](https://latex.codecogs.com/svg.image?{Work}_3-H_3&plus;F_3-{Work}_2=0) <br>
![cst12](https://latex.codecogs.com/svg.image?{Work}_4-H_4&plus;F_4-{Work}_3=0) <br>
![cst13](https://latex.codecogs.com/svg.image?{Work}_5-H_5&plus;F_5-{Work}_4=0) <br>
![cst14](https://latex.codecogs.com/svg.image?{Work}_6-H_6&plus;F_6-{Work}_5=0) <br>
![cst15](https://latex.codecogs.com/svg.image?x_i-40{Work}_i=0\&space;\&space;;\&space;i=\&space;1,\&space;2,\&space;3,\&space;4,\&space;5,\&space;6) <br>
![cst16](https://latex.codecogs.com/svg.image?y_i-2.5{Work}_i\le0\&space;;\&space;i\&space;=\&space;1,\&space;2,\&space;3,\&space;4,\&space;5,\&space;6) <br>

![cst17](https://latex.codecogs.com/svg.image?x_i,\&space;{\&space;y}_i,\&space;{\&space;H}_i,\&space;{\&space;F}_i,\&space;{\&space;Sub}_i,\&space;{\&space;Back}_i,{\&space;Inv}_i,{\&space;Work}_i\geq0) <br>

### Answer

```julia
Objective value: 217340.0
x = [2600.0, 2600.0, 2600.0, 2560.0, 2560.0, 2560.0]
y = [-0.0, -0.0, -0.0, -0.0, -0.0, -0.0]
H = [-0.0, -0.0, -0.0, -0.0, -0.0, -0.0]
F = [15.0, -0.0, -0.0, 1.0, 0.0, -0.0]
Sub = [-0.0, -0.0, -0.0, 20.0, -0.0, -0.0]
Back = [-0.0, -0.0, -0.0, 220.0, -0.0, 0.0]
Inv = [2000.0, 1600.0, 1000.0, -0.0, 140.0, 500.0]
Work = [65.0, 65.0, 65.0, 64.0, 64.0, 64.0]
```
|variable/month|September|October|November|December|January|February|
|--------------|---------|-------|--------|--------|-------|--------|
|x|2600 | 2600 | 2600 | 2560 |2560| 2560|
|y|0 | 0 | 0 | 0 | 0 | 0 |
|H|0 | 0 | 0 | 0 | 0 | 0 |
|F|15 | 0 | 0 | 1 | 0 | 0 |
|Sub | 0.0 | 0 | 0 | 20 | 0 | 0 |
|Back | 0 | 0 | 0 | 220 | 0 | 0 |
|Inv | 2000 | 1600 | 1000 | 0 | 140 | 500 |
|Work |65 | 65 | 65 | 64 | 64 | 64 |
