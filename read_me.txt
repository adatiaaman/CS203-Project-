Car Parking System - Verilog and FPGA


Aman Pankaj Adatia - 2020CSB1154
Rishabh Jain - 2020CSB1198


Specifications:
Inputs: Weight[3:0], Entry_Exit, Enable, Tag[3:0]
Outputs: Level[1:0], Reject
Intermediate Variables: Capacity[7:0], Threshold[3:0][3:0]


Module definition:
module car_park (Weight[3:0], Entry_Exit, Enable, Level[1:0], Tag[7:0]);


Definition/Significance:
Enable - Only after Enable is 1, the input will be processed by the system.
Entry_Exit - If 1, vehicle will be entered and a Tag will be generated which will be displayed. If 0, based on the Tag inputted, that vehicle will be exited from the system. 
Weight - Input the weight of the vehicle that enters the parking system.
Threshold - Based on the threshold, the weight will be judged and accordingly the level will be allotted.
Level - Level allotted to the vehicle (displayed using LED).
Capacity - It will keep track of how many vehicles are there in the system. We can Increase it by 1, when exited and Decrease it by 1, when entered.
Reject - If a spot cannot be allotted, then Reject becomes 1.


Functionality:
We will input the Weight, Tag, Entry_Exit and set the Enable according to the Pin numbers mentioned below. Based on the Threshold, the Level will be outputted on the LED and the Tag will be displayed on the 7-segment display. If the capacity is full, then no vehicle can enter the system (L1 LED glows, else P1 glows), but the vehicles can exit at that moment. 


FPGA Pin Numbers: 
R2 - Entry_Exit
T1, U1, W2, R3 - Weight[3:0]
DISP1 - Tag[3:0]
V19, U19, E19, U16 (LED) - Level[1:0]
BTNC(U18) - Enable
L1, P1 - Reject