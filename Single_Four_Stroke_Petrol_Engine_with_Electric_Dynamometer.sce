clc

// ********************* Calculate the performance parameters of single cylinder ********************************
// *********************** Four Stroke Petrol Engine with Electric Dynamometer **********************************

printf("Calculate the Performance Parameters of Single Cylinder Four Stroke Petrol Engine with Electric Dynamometer\n");
printf("\n");

// ************* Specifications ****************
printf("************* Specifications ****************\n");
printf("Engine Type: Four-Stroke, Air-Cooled, Cold Start, Petrol Engine\n");
printf("No. of Cylinder: One\n");
printf("Bore Diameter: 73 mm\n");
printf("Clearance Volume: 50 cm3\n");
printf("Swept Volume: 256 cm3\n");
printf("Compression Ratio: 5.1:1\n");
printf("Calorific Value of Fuel (Petrol): 45200 kJ/kg\n");
printf("Specific Gravity of Fuel: 0.7 gm/cc\n");
printf("Size of Orific: 16 mm\n");

// ************* Basic Information ****************
d = 73 // Diameter of Cylinder Bore in mm
L = 61 // Stroke length in mm
D = 16 // Diameter of Orifice in mm
CV = 45200 // Calorific Value of Petrol in kJ/kg
Pf = 0.7 // Specific Gravity of Petrol
Cpw = 4.186 // Specific Heat of water
Cd = 0.65 // Co-efficient of Discharge
P = 101325 // Atmospheric Pressure in kN/m2
g = 9.81 // Acceleration due to Gravity in m/s2
Clv = 50 // Clearance Volume in cm3
r = 5.1 // Compression Ratio
N = 1500 // Engine speed
// ************************************************

// ********************** Observations ***************************
BP = 2 // Effective Load on Engine kg
T = 38 // Time taken in seconds for Consumption of 25 cc of Petrol
Mw = 2.0 // Water Flow to Engine in Litre/minute
T1 = 23 // Water Inlet Temperature to Calorimeter in C
T2 = 29 // Water Outlet Temperature from Calorimeter in C
T3 = 654 // Exhaust Gas Outlet Temperature from Engine in C
T4 = 189 // Exhaust Gas Inlet Temperature to Calorimeter in C
T5 = 134 // Exhaust Gas Outlet Temperature from Calorimeter in C
T6 = 25 // Atmospheric Temperature in C
Hw = 22 // Pressure Difference in U-Tube Manometer in mm
// ***************************************************************
printf("\n");

// ********************* Calculations ****************************

// ************ Brake Power ************
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
H = Tfc * CV; // Total Fuel Consumption * Calorific Value of Petrol
// *****************************************

// *********** Heat Goes to Exhaust Gases (H3) *************
H3 = Mw * Cpw * (T2 - T1) * (T3 - T6)/(T4 - T5);
// ***********************************************************

// *********** Heat Carried Away by Cooling Water (H2) *************
H2 = 0;

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
printf("Heat Carried Away by Cooling Water (H2) = 0 kJ/min because engine is air cooled\n");
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

// *********** Air Standard Efficiency (Nas) *************
Nas = (1 - (1/(r^0.4)))*100
printf("Air Standard Efficiency (Nas) = %f percent\n",Nas);
// *********************************************************
