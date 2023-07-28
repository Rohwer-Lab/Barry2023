
# Keywords
Description: ITC_Prx_dim-dec
Modelname: ITC_Prx_dim-dec
Output_In_Conc: False
Species_In_Conc: False

# GlobalUnitDefinitions
UnitVolume: litre, 1.0, -3, 1
# UnitLength: metre, 1.0, 0, 1
UnitSubstance: mole, 1.0, -9, 1
# UnitArea: metre, 1.0, 0, 2
UnitTime: second, 1, 0, 1

# Compartments
Compartment: cell_volume, 1.4, 3
    
Disassociation@cell_volume:
    decamers = {5.0}dimers
    (koff*decamers/cell_volume - kon*(dimers/cell_volume)**exponent)*cell_volume

# Rate rule for monitoring cell_volume
RateRule: cell_volume { 0 }

# Event definitions
Event: injection_prot, cos((_TIME_-1)*2*pi/injection_interval) > 0.99999999 {
    decamers = decamers + injection_decamer
    dimers = dimers + injection_dimer
    cell_volume = cell_volume + injection_volume
    }

# Variable species
dimers@cell_volume = 0.0582*1.4    # n=CV this is in nmol
decamers@cell_volume = 0.0
 
# Parameters
koff = 0.102
kon = 0.0927272
exponent = 5
Kd_app = 1.1
injection_volume = 0.0016                     # mL
injection_dimer = 1.6114240349346223*0.0016   # nmol
injection_decamer = 9.877715193013076*0.0016  # nmol
injection_interval = 200.0
first_inject_ratio = 1.0

# monitor concentrations via forcing functions
!F Cdec = decamers/cell_volume
!F Cdim = dimers/cell_volume

