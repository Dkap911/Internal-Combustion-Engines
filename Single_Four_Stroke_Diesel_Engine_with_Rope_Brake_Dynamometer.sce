clc

// ********************* Calculate the performance parameters of single cylinder ********************************
// *********************** Four Stroke Diesel Engine with Rope Brake Dynamometer **********************************

printf("Calculate the Performance Parameters of Single Cylinder Four Stroke Diesel Engine with Rope Brake Dynamometer\n");
printf("\n");

// ************* Specifications ****************
printf("************* Specifications ****************\n");
printf("Engine Type: Four-Stroke, Forced Air-Cooled\n");
printf("No. of Cylinders: One\n");
printf("Bode Diameter: 80 mm\n");
printf("Engine Speed: 1500\n");
printf("Brake Horse Power of Engine: 5 hp\n");
printf("Compression Ratio: 16.7:1\n");
printf("Fuel Oil: High-Speed Diesel\n");
printf("Density of Fuel: 0.8275\n");
printf("Calorific Value of Diesel: 44600 kJ/kg\n");
printf("Co-efficient of Discharge: 0.62\n");
printf("Diameter of Brake Drum: 280 mm\n");
printf("Diameter of Rope: 20 mm\n");
printf("Torque Arm Length: 0.185 m\n");
printf("Diameter of Orifice: 16 mm\n");
printf("*********************************************\n");
//************************************************

// ************* Basic Information ****************
d = 80 // Diameter of Cylinder Bore in mm
L = 110 // Stroke length in mm
D = 16 // Diameter of Orifice in mm
CV = 44600 // Calorific Value of Diesel in kJ/kg
Pf = 0.82 // Specific Gravity of Diesel
Cpw = 4.186 // Specific Heat of water
Cd = 0.65 // Co-efficient of Discharge
P = 101325 // Atmospheric Pressure in kN/m2
Dbd = 280 // Diameter of Brake Drum in mm
Dr = 20 // Diameter of Rope in mm
R = 185 // Torque Arm Length in mm
g = 9.81 // Acceleration due to Gravity in m/s2
// ************************************************

// ********************** Observations ***************************
W1 = 12.75 // Weight of Rope and Hanger in kg
W2 = 0.50 // Weight on Spring Balance Weight in kg
W = W1 - W2 //Effective Load on Engine in kg
N = 1500 // Engine rpm
T = 81 // Time taken in seconds for Consumption of 25 cc of Diesel
Mw = 1.8 // Water Flow to Engine in Litre/minute
T1 = 26 // Water Inlet Temperature to Calorimeter in C
T2 = 37 // Water Outlet Temperature from Calorimeter in C
T3 = 327 // Exhaust Gas Outlet Temperature from Engine in C
T4 = 237 // Exhaust Gas Inlet Temperature to Calorimeter in C
T5 = 54 // Exhaust Gas Outlet Temperature from Calorimeter in C
T6 =  38 // Water Inlet Temperature to Engine in C
T7 = 67 // Water Outlet Temperature from Engine in C
T8 = 27 // Atmospheric Temperature in C
Hw = 145 // Pressure Difference in U-Tube Manometer in mm
// ***************************************************************
printf("\n");

// ********************* Calculations ****************************

// ************ Brake Power ************
BP = (2*3.14*N*W*(R/1000)*g)/(60*1000); 
printf("Brake Power (BP) = %f kW\n",BP);
// *************************************

// ******* Heat Equivalent to BP (H1) ********
H1 = BP * 60;
// ********************************************

// ******* Total Fuel Consumption (TFC) *******
Tfc = (25*60*Pf)/(1000*T); // Mass of Fuel Consumed per minute
printf("Total Fuel Consumption (TFC) = %f kg/min\n",Tfc);
// ********************************************

// *********** Heat Input (H) *************
H = Tfc * CV; // Total Fuel Consumption * Calorific Value of Diesel
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
QS = (3.14/4)*(d/1000)^2*(L/1000)*N/(2*60);
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
