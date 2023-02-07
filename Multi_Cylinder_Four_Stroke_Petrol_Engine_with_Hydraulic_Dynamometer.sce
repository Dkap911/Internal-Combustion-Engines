clc

// ********************* Calculate the performance parameters of multi cylinder ********************************
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
D = 16 // Diameter of Orifice in mm
CV = 45200 // Calorific Value of Petrol in kJ/kg
Pf = 0.7 // Specific Gravity of Petrol
Cpw = 4.186 // Specific Heat of water
Cd = 0.65 // Co-efficient of Discharge
P = 101325 // Atmospheric Pressure in kN/m2
g = 9.81 // Acceleration due to Gravity in m/s2
r = 9.2 // Compression Ratio
CC = 800 // Engine Capacity CC
// ************************************************

// ********************** Observations ***************************
N = 2000 // Engine Speed
C = 2000 // Dynamometer Constant
W = 2.9 // Effective Load on the Engine
T = 9.44 // Time taken in seconds for Consumption of 5 cc of Petrol
Mw = 4.2 // Water Flow to Engine in Litre/minute
T1 = 32 // Water Inlet Temperature to Calorimeter in C
T2 = 36 // Water Outlet Temperature from Calorimeter in C
T3 = 283 // Exhaust Gas Outlet Temperature from Engine in C
T4 = 275 // Exhaust Gas Inlet Temperature to Calorimeter in C
T5 = 40 // Exhaust Gas Outlet Temperature from Calorimeter in C
T6 = 36 // Water Inlet Temperature to Engine in C
T7 = 52 // Water Outlet Temperature from Engine in C
T8 = 34 // Atmospheric Temperature in C
Hw = 13 // Pressure Difference in U-Tube Manometer in mm
// ***************************************************************
printf("\n");

// ************ Brake Power ************
BP = (W*N*0.746)/C;
printf("Brake Power (BP) = %f kW\n",BP);
// *************************************

// ******* Heat Equivalent to BP (H1) ********
H1 = BP * 60;
// ********************************************

// ******* Total Fuel Consumption (TFC) *******
Tfc = (5*60*Pf)/(1000*T); // Mass of Fuel Consumed per minute
printf("Total Fuel Consumption (TFC) = %f kg/min\n",Tfc);
// ********************************************

// *********** Heat Input (H) *************
H = Tfc * CV; // Total Fuel Consumption * Calorific Value of Petrol
// *****************************************

// *********** Heat Goes to Exhaust Gases (H3) *************
H3 = Mw * Cpw * (T2 - T1) * (T3 - T8)/(T4 - T5);
// ***********************************************************

// *********** Heat Carried Away by Cooling Water (H2) *************
H2 = Mw*Cpw*(T7 - T6);
// ******************************************************************

// *********** Heat Unaccounted (H4) *************
H4 = H - (H1 + H2 + H3);
// ************************************************

// *********** Heat Balance Sheet *************
PH1 = H1*100/H;
PH2 = H2*100/H;
PH3 = H3*100/H;
PH4 = H4*100/H;
printf("*********** Heat Balance Sheet *************\n");
printf("\n");
printf("Heat Supplied by Fuel (H)\n");
printf("Heat Supplied = %f kJ/min\n",H);
printf("Percentage Heat Supplied = 100 percent\n");
printf("\n");
printf("Heat Equivalent to BP (H1)\n");
printf("Heat Rejected = %f kJ/min\n",H1); 
printf("Percentage Heat Rejected = %f percent\n",PH1);
printf("\n");
printf("Heat Carried Away by Cooling Water (H2)\n");
printf("Heat Rejected = %f kJ/min\n",H2); 
printf("Percentage Heat Rejected = %f percent\n",PH2);
printf("\n");
printf("Heat Goes to Exhaust Gases (H3)\n");
printf("Heat Rejected = %f kJ/min\n",H3); 
printf("Percentage Heat Rejected = %f percent\n",PH3);
printf("\n");
printf("Heat Unaccounted (HUA)\n");
printf("Heat Rejected = %f kJ/min\n",H4); 
printf("Percentage Heat Rejected = %f percent\n",PH4);
printf("\n");
printf("Total Heat Supplied = %f kJ/min\n",H);
printf("Total Heat Rejected = %f kJ/min + %f kJ/min + %f kJ/min + %f kJ/min = %f kJ/min\n",H1,H2,H3,H4,H);
printf("*********************************************\n");

// *********** Swept Volume (QS) *************
QS = (CC*N)/(2*60*10^6);
printf("Swept Volume (Qs) = %f m3/sec\n",QS);
// *******************************************

// *********** Weight of Air Consumption (Qa) *************
A = (3.14/4)*(D/1000)^2;
Da = P/(287*(T8+273));
Ha = Hw/Da;
Qa = Cd * A * sqrt(2*9.81*Ha);
printf("Weight of Air Consumption (Qa) = %f m3/sec\n",Qa);
// ********************************************************

// *********** Volumetric Efficiency (Nv) *************
Nv = Qa*100/QS;
printf("Volumetric Efficiency (Nv) = %f percent\n",Nv);
// ****************************************************

// *********** Air-Fuel Ratio (AF) *************
AF = (Qa*60)/Tfc;
printf("Air-Fuel Ratio = %f\n",AF);
// *********************************************

// *********** Brake Specific Fuel Consumption (BSFC) *************
BSFC = Tfc*60/BP;
printf("Brake Specific Fuel Consumption (BSFC) = %f kg/kW-hr\n",BSFC);
// ****************************************************************

// *********** Brake Thermal Efficiency (Nbth) *************
Nbth = (BP*60*100)/H;
printf("Brake Thermal Efficiency (Nbth) = %f percent\n",Nbth);
// *********************************************************

// *********** Air Standard Efficiency (Nas) *************
Nas = (1 - (1/(r^0.4)))*100
printf("Air Standard Efficiency (Nas) = %f percent\n",Nas);
// *********************************************************
