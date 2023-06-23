
# GlobalUnitDefinitions
UnitVolume: litre, 1.0, -6, 1
# UnitLength: metre, 1.0, 0, 1
UnitSubstance: mole, 1.0, -6, 1
# UnitArea: metre, 1.0, 0, 2
UnitTime: second, 1, 0, 1


# Reactions
Decamer_disassociation:
    SH_SH__SH_SH__SH_SH__SH_SH__SH_SH = {5}SH_SH
    k_Prx_dec_disasso*SH_SH__SH_SH__SH_SH__SH_SH__SH_SH- k_Prx_asso*((SH_SH))**exponent

# Species
SH_SH__SH_SH__SH_SH__SH_SH__SH_SH = 0
SH_SH = 0

# Parameters
k_Prx_dec_disasso = 0
k_Prx_asso = 0
exponent = 5

# Dilution parameters
dilution_factor = 1

