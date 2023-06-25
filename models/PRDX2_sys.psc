

Function: MM_irr_2S, E, kcat, s1, km_s1, s2, km_s2 {
(E*kcat)*(s1/(km_s1+s1))*(s2/(km_s2+s2))}

### Reactions (Flag for scripting)

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

# Disulphide bridge reduction via Thioredoxin
Prx_R_S_red_TrxSH:
    SH_SS + TrxSH > SH_SH + TrxSOH
    kred*SH_SS*TrxSH

Prx_O_S_red_TrxSH:
    SOH_SS + TrxSH > SH_SOH + TrxSOH
    kred*SOH_SS*TrxSH

Prx_S_S_red_TrxSH:
    SS_SS + TrxSH > SH_SS + TrxSOH
    2*kred*SS_SS*TrxSH

Prx_S_O2_red_TrxSH:
    SS_SO2H + TrxSH > SH_SO2H + TrxSOH
    kred*SS_SO2H*TrxSH

# Trx regeneration
Trx_red1:
    TrxSOH + NADPH > NADP + TrxSH
    MM_irr_2S(TRR,kcat_TRR,TrxSOH,KM_TrxSOH_TRR,NADPH,KM_NADPH_TRR)

H2O2_production:
    $pool > H2O2
    0.0

### Parameters (Flag for scripting)
kprx = 100 # μM/s
ksulf = 0.012 
kcond = 1.7
kred = 0.21

TRR = 0.14
kcat_TRR = 73
KM_TrxSOH_TRR = 1.83
KM_NADPH_TRR = 6.0

### Species (Flag for scripting)
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

TrxSH = 5.0
TrxSOH = 0.0

NADPH = 5.0
NADP = 0.0

### References (Flag for scripting)

### End (Flag for scripting)
