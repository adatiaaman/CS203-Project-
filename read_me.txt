Car Parking System - Verilog


Aman Pankaj Adatia - 2020CSB1154
Rishabh Jain - 2020CSB1198


Specifications:
Inputs: Weight[3:0], Entry_Exit, Enable, cap_enable
Outputs: Level[1:0], Reject
Intermediate Variables: Capacity0, Capacity1, Capacity2, Capacity3, Threshold[3:0][3:0]


Module definition:
module car_park (Weight, Entry_Exit, Enable, Level, Reject, Capacity0, Capacity1, Capacity2, Capacity3, cap_enable);


Definition/Significance:
Enable - Only after Enable is 1, the input will be processed by the system.
Entry_Exit - If 1, vehicle will be entered and a Tag will be generated which will be displayed. If 0, based on the Tag inputted, that vehicle will be exited from the system. 
Weight - Input the weight of the vehicle that enters the parking system.
Threshold - Based on the threshold, the weight will be judged and accordingly the level will be allotted.
Level - Level allotted to the vehicle (displayed using LED).
cap_enable - Variable used to initialise Capacity for each level
Capacity - It will keep track of how many vehicles are there in the system. We can Increase it by 1, when exited and Decrease it by 1, when entered. Capacity0, Capacity1, Capacity2 and Capacity3 variables storing space for each level.
Reject - If a spot cannot be allotted, then Reject becomes 1.


Testbench: 

Functionality:
First, we will initialise the Capacity of each level to maximum, by setting cap_enable to 1.
We will input the Weight, Entry_Exit and set the Enable/ Based on the Threshold, the Level will be decided. If the capacity is full, then no vehicle can enter the system as it will be rejcted, but the vehicles can exit at that moment. 
