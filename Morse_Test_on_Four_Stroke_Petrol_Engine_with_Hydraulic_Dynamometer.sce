clc

// *********************************** Perform Morse Test on  ****************************************************
// *********************** Four Stroke Petrol Engine with Hydraulic Dynamometer **********************************

printf("Calculate the Performance Parameters of Multi Cylinder Four Stroke Petrol Engine with Hydraulic Dynamometer\n");
printf("\n");

// ************* Specifications ****************
printf("************* Specifications ****************\n");
printf("Engine Type: Four-Stroke, Three - Cylinder Petrol Engine of Maruti Suzuki Omni Van\n");
printf("No. of Cylinder: Three\n");
printf("Engine Capacity: 800 cc\n");
printf("Compression Ratio: 9.2:1\n");
printf("Calorific Value of Fuel (Petrol): 45200 kJ/kg\n");
printf("Specific Gravity of Fuel: 0.7 gm/cc\n");
printf("Dynamometer Arm Length: 358.2 mm\n");

// ************* Basic Information ****************
r = 9.2 // Compression Ratio
// ************************************************

// ********************** Observations ***************************
N = 2000 // Engine Speed
C = 2000 // Dynamometer Constant
W = 8 // Effective Load on the Engine when all cylinders are fired
W1 = 4.75 //Effective Load on the Engine when 1st Cylinder Cut-Off
W2 = 4.75 //Effective Load on the Engine when 2nd Cylinder Cut-Off
W3 = 4.75 //Effective Load on the Engine when 3rd Cylinder Cut-Off
// ***************************************************************
printf("\n");

// ************ Brake Power ************
// ************ All Fired **************
BP = (W*N*0.746)/C;
printf("Brake Power (BP) = %f kW\n",BP);
// *************************************

// ************ 1st Cylinder Cut-Off **************
BP1 = (W1*N*0.746)/C;
printf("Brake Power (BP) 1st Cylinder Cut-Off = %f kW\n",BP1);
// ************************************************

// ************ 2nd Cylinder Cut-Off **************
BP2 = (W2*N*0.746)/C;
printf("Brake Power (BP) 2nd Cylinder Cut-Off = %f kW\n",BP2);
// ************************************************

// ************ 3rd Cylinder Cut-Off **************
BP3 = (W3*N*0.746)/C;
printf("Brake Power (BP) 3rd Cylinder Cut-Off = %f kW\n",BP3);
// ************************************************

// ************ Indicated Power ************
// ************ 1st Cylinder Cut-Off **************
IP1 = BP - BP1
printf("Indicated Power (IP) 1st Cylinder Cut-Off = %f kW\n",IP1);
// ************************************************

// ************ 2nd Cylinder Cut-Off **************
IP2 = BP - BP2
printf("Indicated Power (IP) 2nd Cylinder Cut-Off = %f kW\n",IP2);
// ************************************************

// ************ 3rd Cylinder Cut-Off **************
IP3 = BP - BP3
printf("Indicated Power (IP) 3rd Cylinder Cut-Off = %f kW\n",IP3);
// ************************************************

// ************ Total Indicated Power ************
IP = IP1 + IP2 + IP3;
printf("Total Indicated Power (IP) = %f kW\n",IP);
//************************************************

// **************** Frictional Power *************
FP = IP - BP;
printf("Frictional Power (FP) = %f kW\n",FP);
//************************************************

// ********** Mechanical Efficiency *************
Nmech = (BP/IP)*100
printf("Mechanical Efficiency (Nmech) = %f percentage\n",Nmech);
//************************************************

// ********** Air-Standard Efficiency *************
Nas = (1 - (1/(r^0.4)))*100
printf("Air Standard Efficiency (Nas) = %f percent\n",Nas);
// *********************************************************
