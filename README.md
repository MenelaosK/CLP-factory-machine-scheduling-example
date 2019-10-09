# CLP-factory-machine-scheduling-example
A small example of using CLP to schedule start times of machines in a factory.

This example has as data 6 machines, written in this format: machine(<Name>,<Hours>, <Power Consumption>,<Workers>), where hours are
the hours needed for the machine to finish,power consumption is how much power it needs and workers, how many workers are required
for the machine to work.
The factory has the following constraints: 1)all workers=5, 2)max power=60KW.
The program finds each machine's start time and calculates the time needed for all machines to finish their work(Makespan).
The image below shows the result of this example with the above constraints and these data:
<br> machine(a,20,40,3).
<br> machine(b,40,20,2).
<br> machine(c,35,10,1).
<br> machine(d,15,45,2).
<br> machine(e,15,5,3).
<br> machine(f,20,7,4).
 
 ![](https://github.com/MenelaosK/CLP-factory-machine-scheduling-example/blob/master/factoryScheduling.png)
