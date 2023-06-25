
### Reactions (Flag for scripting)
HRP_ox:
    HRP + H2O2 > compound_I
    k_HRP*HRP*H2O2

# Oxidation reactions
Prx_R_R_ox:
    SH_SH + H2O2 > SH_SOH
    2*kprx*SH_SH*H2O2

Prx_R_S_ox:
    SH_SS + H2O2 > SOH_SS
    kprx*SH_SS*H2O2

Prx_R_O_ox:
    SH_SOH + H2O2 > SOH_SOH
    kprx*SH_SOH*H2O2

Prx_R_O2_ox:
    SH_SO2H + H2O2 > SOH_SO2H
    kprx*SH_SO2H*H2O2

# Over-oxidation reactions
Prx_O_O_oox:
    SOH_SOH + H2O2 > SOH_SO2H
    2*ksulf*SOH_SOH*H2O2

Prx_O_S_oox:
    SOH_SS + H2O2 > SS_SO2H
    ksulf*SOH_SS*H2O2

Prx_R_O_oox:
    SH_SOH + H2O2 > SH_SO2H
    ksulf*SH_SOH*H2O2

Prx_O_O2_oox:
    SOH_SO2H + H2O2 > SO2H_SO2H
    ksulf*SOH_SO2H*H2O2

# Disulphide bridge formation
Prx_R_O_disulf_form:
    SH_SOH > SH_SS
    kcond*SH_SOH

Prx_O_O_disulf_form:
    SOH_SOH > SOH_SS
    2*kcond*SOH_SOH

Prx_O_S_disulf_form:
    SOH_SS > SS_SS
    kcond*SOH_SS

Prx_O_O2_disulf_form:
    SOH_SO2H > SS_SO2H
    kcond*SOH_SO2H

H2O2_production:
    $pool > H2O2
    0.0

### Parameters (Flag for scripting)
kprx = 100.00 # μM/s
ksulf = 0.012 
kcond = 1.7

k_HRP = 11.00 # μM/s

### Species (Flag for scripting)
HRP = 10.0 # μM
compound_I = 0 # μM

H2O2 = 4.0 # μM

SH_SH = 10.0
SH_SOH = 0.0
SH_SS = 0.0
SH_SO2H = 0.0
SOH_SOH = 0.0
SOH_SS = 0.0
SOH_SO2H = 0.0
SS_SS = 0.0
SS_SO2H = 0.0
SO2H_SO2H = 0.0

### References (Flag for scripting)

### End (Flag for scripting)
