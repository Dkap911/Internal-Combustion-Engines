clc
// ********************* Calculate the performance parameters of single cylinder ********************************
// *********************** Four Stroke Diesel Engine with Electric Dynamometer **********************************

printf("Calculate the performance parameters of single cylinder Four Stroke Diesel Engine with Electric Dynamometer\n");
printf("\n");

// ************* Basic Information ****************
d = 82 // Diameter of Cylinder Bore in mm
L = 110 // Stroke length in mm
D = 20 // Diameter of Orifice in mm
CV = 44600 // Calorific Value of Diesel in kJ/kg
Pf = 0.82 // Specific Gravity of Diesel
PF = 1.1044 // Power Factor
Cpw = 4.18 // Specific Heat of water
Cd = 0.65 // Co-efficient of Discharge
P = 101325 // Atmospheric Pressure in kN/m2
// ************************************************

// ********************** Observations ***************************
N = 2100 // Engine rpm
W = 1 // Load on Engine in kW
T = 31.3 // Time taken in seconds for Consumption of 10 cc of Diesel
Mw = 5.4 // Water Flow to Engine in cc/sec
Qa = 23.3 // Air Rate in m3/hr
Mc = 30.0 // Water Flow to Calorimeter cc/sec
T1 = 29.8 // Inlet Water Temperature to Engine and Calorimeter in C
T2 = 36.5 // Outlet Water Temperature from Engine Jacket in C
T3 = 67.2 // Outlet Water Temperature from Calorimeter Jacket in C
T4 = 320 // Exhaust Gas Temperature from Engine in C
T5 = 215.2 // Exhaust Gas Temperature after Coolin in C
T6 = 31.4 // Atmospheric Temperature in C
Hw = 59 //Head of Water in Manometer in mm
IMEP = 920 // Mean Effective Pressure in kN/m2
// ***************************************************************

// ********************* Calculations ****************************

// ************ Brake Power ************
BP = W * PF; // Load in kW * Power Factor
// *************************************

// ******* Heat Equivalent to BP (HBP) ********
HBP = BP * 3600;
// ********************************************

// ******* Total Fuel Consumption (TFC) *******
Mf = (10*Pf*60)/(1000*T); // Mass of Fuel Consumed per minute
Tfc = Mf * 60; // Mass of Fuel Consumed per hour
// ********************************************

// *********** Heat Input (HI) *************
HI = Tfc * CV; // Total Fuel Consumption * Calorific Value of Diesel
// *****************************************

// *********** Heat Carried Away by Cooling Water (HJW) *************
HJW = Mw * Cpw * (T2 - T1)*3600/1000; // 3600/1000 to convert mass flow rate in to kg/hr
// ******************************************************************

// *********** Heat Goes to Exhaust Gases (HGAS) *************
HGAS = Mc * Cpw * (T3 - T1) * (T4 - T6) * 3600/((T4 - T5)*1000);
// ***********************************************************

// *********** Heat Unaccounted (HUA) *************
HUA = HI - (HBP + HJW + HGAS);
// ************************************************

// *********** Heat Balance Sheet *************
PHBP = HBP*100/HI;
PHJW = HJW*100/HI;
PHGAS = HGAS*100/HI;
PHUA = HUA*100/HI;
printf("*********** Heat Balance Sheet *************\n");
printf("\n");
printf("Heat Supplied by Fuel (HI)\n");
printf("Heat Supplied = %f kJ/hr\n",HI);
printf("Percentage Heat Supplied = 100 percent\n");
printf("\n");
printf("Heat Equivalent to BP (HBP)\n");
printf("Heat Rejected = %f kJ/hr\n",HBP); 
printf("Percentage Heat Rejected = %f percent\n",PHBP);
printf("\n");
printf("Heat Carried Away by Cooling Water (HJW)\n");
printf("Heat Rejected = %f kJ/hr\n",HJW); 
printf("Percentage Heat Rejected = %f percent\n",PHJW);
printf("\n");
printf("Heat Goes to Exhaust Gases (HGAS)\n");
printf("Heat Rejected = %f kJ/hr\n",HGAS); 
printf("Percentage Heat Rejected = %f percent\n",PHGAS);
printf("\n");
printf("Heat Unaccounted (HUA)\n");
printf("Heat Rejected = %f kJ/hr\n",HUA); 
printf("Percentage Heat Rejected = %f percent\n",PHUA);
printf("\n");
printf("Total Heat Supplied = %f kJ/hr\n",HI);
printf("Total Heat Rejected = %f kJ/hr + %f kJ/hr + %f kJ/hr + %f kJ/hr = %f kJ/hr\n",HBP,HJW,HGAS,HUA,HI);
printf("*********************************************\n");

printf("\n");
printf("*********** Calculated Performance Parameters *************\n");
printf("\n");
printf("Brake Power = %f kW\n",BP);
printf("Total Fuel Consumption = %f kg/hr\n",Tfc);
// *********** Weight of Air Consumption (Ma) *************
A = (3.14/4)*(D/1000)^2;
Da = P/(287*(T6+273));
Ha = Hw/Da;
Ma = Cd * A * sqrt(2*9.81*Ha)*3600;
printf("Weight of Air Consumption (Ma) = %f kg/hr\n",Ma);
// ********************************************************

// *********** Swept Volume (QS) *************
QS = (3.14/4)*(d/1000)^2*(L/1000)*(N*60)/2;
printf("Swept Volume (Qs) = %f m3/hr\n",QS);
// *******************************************

// *********** Air-Fuel Ratio (AF) *************
AF = (Ma*Da)/Tfc;
printf("Air-Fuel Ratio = %f\n",AF);
// *********************************************

// *********** Indicated Power (IP) *************
IP = (IMEP * (3.14/4) * (d/1000)^2 * (L/1000) * N)/120;
printf("Indicated Power (IP) = %f kW\n",IP);
// *********************************************

// *********** Frictional Power (IP) *************
FP = IP - BP;
printf("Frictional Power (IP) = %f kW\n",FP);
// ***********************************************

// *********** Brake Specific Fuel Consumption (BSFC) *************
BSFC = Tfc/BP;
printf("Brake Specific Fuel Consumption (BSFC) = %f kg/kW-hr\n",BSFC);
// ****************************************************************

// *********** Indicated Specific Fuel Consumption (ISFC) *************
ISFC = Tfc/IP;
printf("Indicated Specific Fuel Consumption (ISFC) = %f kg/kW-hr\n",ISFC);
// ****************************************************************

// *********** Mechanical Efficiency (Nm) *************
Nm = BP*100/IP;
printf("Mechanical Efficiency (Nm) = %f percent\n",Nm);
// *****************************************************

// *********** Brake Thermal Efficiency (Nbth) *************
Nbth = (BP*3600*100)/HI;
printf("Brake Thermal Efficiency (Nbth) = %f percent\n",Nbth);
// *********************************************************

// *********** Indicated Thermal Efficiency (Nith) *************
Nith = (IP*3600*100)/HI;
printf("Indicated Thermal Efficiency (Nith) = %f percent\n",Nith);
// *************************************************************
printf("***********************************************************\n");
