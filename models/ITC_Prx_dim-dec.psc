
# GlobalUnitDefinitions
UnitVolume: litre, 1.0, -6, 1
# UnitLength: metre, 1.0, 0, 1
UnitSubstance: mole, 1.0, -6, 1
# UnitArea: metre, 1.0, 0, 2
UnitTime: second, 1, 0, 1

# Compartments
Compartment: cell_volume, 1400, 3
    
Disassociation@cell_volume:
    decamers = {5}dimers
    koff*decamers - kon*dimers**exponent

# Initial species
dimers@cell_volume  = 0
decamers@cell_volume  = 0

# Parameters
kon = 1
koff = 1
exponent = 130
Kd_app = 1 # Not needed for sims

# Injection parameters
injection_volume = 1.6
injection_dimer = 0.8
injection_decamer = 6.84
injection_interval = 180
first_inject_ratio = 1

Event: first_injection_prot, _TIME_ > 0.0,0 {
dimers = (dimers*cell_volume + first_inject_ratio*injection_dimer*injection_volume + first_inject_ratio*injection_decamer*injection_volume*5)/(cell_volume+injection_volume)
}

Event: first_injection_vol, _TIME_ > 0.0,0 {
cell_volume = cell_volume + injection_volume
}

Event: injection_prot, cos((_TIME_-1)*2*pi/injection_interval) > 0.99999999999,0 {
decamers = (decamers*cell_volume + injection_decamer*injection_volume)/(cell_volume+injection_volume)
dimers = (dimers*cell_volume + injection_dimer*injection_volume)/(cell_volume+injection_volume)
}

Event: injection_vol, cos((_TIME_-1)*2*pi/injection_interval) > 0.99999999999,0 {
cell_volume = cell_volume + injection_volume 
}
    
