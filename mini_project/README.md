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




