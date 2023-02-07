clc
// ********************* Calculate the performance parameters of single cylinder ********************************
// *********************** Two Stroke Petrol Engine with Rope Brake Dynamometer **********************************

printf("Calculate the Performance Parameters of Single Cylinder Two Stroke Petrol Engine with Rope Brake Dynamometer\n");
printf("\n");

// ************* Specifications ****************
printf("************* Specifications ****************\n");
printf("Engine Type: Two-Stroke, Forced Air-Cooled\n");
printf("No. of Cylinders: One\n");
printf("Bode Diameter: 57 mm\n");
printf("Stroke Length: 57 mm\n");
printf("Swept Volume: 145.37 CC\n");
printf("Compression Ratio: 7.4 \n");
printf("Maximum Net Power: 4.64 kW at 5200 rpm of Engine\n");
printf("Maximum Net Torque: 10 N-m at 3500 rpm of Engine\n");
printf("Intake System: Rotary Valve Type\n");
printf("Ignition System: Contact Breaker type\n");
printf("CB Point Gap: 0.4 - 0.5 mm\n");
printf("Ignition Timing: 221 Degree Before TDC\n");
printf("Carburetor: Down Draught 15 mm Venturi Carburetor\n");
printf("Spark Plug: Mico W 175Z 1 Modi Champion LG2YC Forbes\n");
printf("Spark Plug Gap: 0.5 - 0.6 mm\n");
printf("Lubrication: 2 percent Mixture of Self Mixing Oil Petrol\n");
printf("Starting: Kick Start\n");
printf("Fuel Oil: Petrol\n");
printf("Density of Fuel: 0.7 gm/cc\n");
printf("Calorific Value: 45200 kJ/kg\n");
printf("Co-efficient of Discharge: 0.65\n");
printf("Diameter of Brake Drum: 200 mm\n");
printf("Diameter of Rope: 20 mm\n");
printf("*********************************************\n");
//************************************************

// ************* Basic Information ****************
d = 57 // Diameter of Cylinder Bore in mm
L = 57 // Stroke length in mm
D = 16 // Diameter of Orifice in mm
CV = 45200 // Calorific Value of Diesel in kJ/kg
Pf = 0.7 // Specific Gravity of Petrol
Cpw = 4.186 // Specific Heat of water
Cd = 0.65 // Co-efficient of Discharge
P = 101325 // Atmospheric Pressure in kN/m2
Dbd = 200 // Diameter of Brake Drum in mm
Dr = 20 // Diameter of Rope in mm
g = 9.81 // Acceleration due to Gravity in m/s2
// ************************************************

// ********************** Observations ***************************
N = 3000 // Engine rpm
W = 10.55 // Effective Load on Engine kg
T = 102 // Time taken in seconds for Consumption of 25 cc of Diesel
Mw = 1.4 // Water Flow to Engine in Litre/minute
T1 = 30 // Water Inlet Temperature to Calorimeter in C
T2 = 34 // Water Outlet Temperature from Calorimeter in C
T3 = 487 // Exhaust Gas Outlet Temperature from Engine in C
T4 = 198 // Exhaust Gas Inlet Temperature to Calorimeter in C
T5 = 43 // Exhaust Gas Outlet Temperature from Calorimeter in C
T6 = 30 // Atmospheric Temperature in C
Hw = 20 // Pressure Difference in U-Tube Manometer in mm
// ***************************************************************
printf("\n");

// ********************* Calculations ****************************

// ************ Brake Power ************
BP = (2*3.14*N*W*(Dbd/(1000*2))*g)/(60*1000); 
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
H3 = Mw * Cpw * (T2 - T1) * (T3 - T6)/(T4 - T5);
// ***********************************************************

// *********** Heat Carried Away by Cooling Water (H2) *************
H2 = 0; 
printf("Heat Carried Away by Cooling Water (H2) = 0 kJ/min because engine is air cooled\n");
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
Da = P/(287*(T6+273));
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
