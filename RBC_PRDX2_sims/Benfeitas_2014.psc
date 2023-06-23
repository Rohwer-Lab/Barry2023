# Keywords
Description: H2O2 metabolism
Modelname: Model_1
Output_In_Conc: True
Species_In_Conc: True

# GlobalUnitDefinitions
UnitVolume: litre, 1.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: mole, 1.0, -6, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: second, 1.0, 0, 1

# Compartments # Checked
Compartment: Erythrocyte, 1.0, 3
Compartment: Plasma, 1.70153417015, 3

# Function definitions
Function: GPx1_1, f1 , f2 , H2O2 , GSH  {
H2O2*GSH/(GSH*f1+H2O2*f2)
}
Function: TrxR2_1, VMaxTrxR , KMNADPHTrxR , KMOO , OO , NADPH  {
VMaxTrxR*NADPH*OO/(OO*NADPH+KMNADPHTrxR*OO+NADPH*KMOO)
}
Function: Henri_Michaelis_Menten__irreversible__1, Km , V , NADP  {
V*NADP/(Km+NADP)
}
Function: GSR_1, KMGSSG , KMNADPH , VMax , GSSG , NADPH  {
VMax*NADPH*GSSG/(GSSG*NADPH+GSSG*KMNADPH+NADPH*KMGSSG)
}
Function: Constant_flux__irreversible, v  {
v
}
Function: Henri_Michaelis_Menten__irreversible, substrate , Km , V  {
V*substrate/(Km+substrate)
}
Function: TrxR_1, VMaxTrxR , KMNADPHTrxR , KMOR , NADPH , OR  {
VMaxTrxR*NADPH*OR/(OR*NADPH+KMNADPHTrxR*OR+NADPH*KMOR)
}

# Reactions

H2O2_permeation_in:
    eH2O2 > H2O2
    eH2O2*10.9

H2O2_permeation_out:
    H2O2 > eH2O2
    H2O2*10.9

# Reaction 1 # checked
H2O2_production:
    $pool > H2O2
    Erythrocyte*Constant_flux__irreversible(H2O2_production_v)

# Reaction 4 # checked
GPx1:
    {2.0}GSH + H2O2 > GSSG
    Erythrocyte*GPx1_1(GPx1_f1,GPx1_f2,H2O2,GSH)

# Reaction 5 # checked
GSR:
    GSSG + NADPHfree > {2.0}GSH + NADPfree
    Erythrocyte*GSR_1(GSR_KMGSSG,GSR_KMNADPH,GSR_VMax,GSSG,NADPHfree)

# Reaction 6 # checked
Cat_1:
    H2O2 + Ferri > Cpd1
    Erythrocyte*Cat_1_k1*Ferri*H2O2

# Reaction 7 # checked
Cat_2:
    H2O2 + Cpd1 > Ferri
    Erythrocyte*Cat_2_k1*Cpd1*H2O2

# Reaction 8 # checked
Cat_3:
    Cpd1 > Cpd2
    Erythrocyte*Cat_3_k1*Cpd1

# Reaction 9 # checked
Cat_4:
    Cpd2 > Ferri
    Erythrocyte*Cat_4_k1*Cpd2

# Reaction 10 # checked
Prx2_1:
    PSHPSH + H2O2 > PSOHPSH
    Erythrocyte*two_times_kprx*PSHPSH*H2O2
#&& two_times_kprx = 200


# Reaction 11 # checked
Prx2_2:
    PSOHPSH > PSSPSH
    Erythrocyte*kcond*PSOHPSH

# Reaction 12 # checked
Prx2_3:
    PSOHPSH + H2O2 > PSOHPSOH
    Erythrocyte*kprx*PSOHPSH*H2O2

# Reaction 13 # checked
Prx2_4:
    PSOHPSH + H2O2 > PSO2HPSH
    Erythrocyte*ksulf*PSOHPSH*H2O2

# Reaction 14 # checked
Prx2_5:
    PSSPSH + H2O2 > PSSPSOH
    Erythrocyte*kprx*PSSPSH*H2O2

# Reaction 15 # checked
Prx2_6:
    PSSPSH + RR > PSHPSH + OR
    Erythrocyte*kred*PSSPSH*RR

# Reaction 16 # checked
Prx2_7:
    PSSPSH + RO > PSHPSH + OO
    Erythrocyte*kred*PSSPSH*RO

# Reaction 17 # checked
Prx2_8:
    PSOHPSOH > PSSPSOH
    Erythrocyte*two_times_kcond*PSOHPSOH

# Reaction 18 # checked
Prx2_9:
    H2O2 + PSOHPSOH > PSO2HPSOH
    Erythrocyte*two_times_ksulf*PSOHPSOH*H2O2

# Reaction 19 # checked
Prx2_10:
    PSSPSOH > PSSPSS
    Erythrocyte*kcond*PSSPSOH

# Reaction 20 # checked
Prx2_11:
    H2O2 + PSSPSOH > PSO2HPSS
    Erythrocyte*ksulf*PSSPSOH*H2O2

# Reaction 21 # checked
Prx2_12:
    PSSPSOH + RR > PSOHPSH + OR
    Erythrocyte*kred*PSSPSOH*RR

# Reaction 22 # checked
Prx2_13:
    RO + PSSPSOH > PSOHPSH + OO
    Erythrocyte*kred*PSSPSOH*RO

# Reaction 23 # checked
Prx2_14:
    PSSPSS + RR > PSSPSH + OR
    Erythrocyte*two_times_kred*PSSPSS*RR

# Reaction 24 # checked
Prx2_15:
    PSSPSS + RO > PSSPSH + OO
    Erythrocyte*two_times_kred*PSSPSS*RO

# Reaction 25 # checked
Prx2_16:
    H2O2 + PSO2HPSH > PSO2HPSOH
    Erythrocyte*kprx*PSO2HPSH*H2O2

# Reaction 26 # checked
Prx2_17:
    PSO2HPSH > PSOHPSH
    Erythrocyte*ksrx*PSO2HPSH

# Reaction 27 # checked
Prx2_18:
    PSO2HPSOH > PSO2HPSS
    Erythrocyte*kcond*PSO2HPSOH

# Reaction 28 # checked
Prx2_19:
    PSO2HPSOH + H2O2 > PSO2HPSO2H
    Erythrocyte*ksulf*PSO2HPSOH*H2O2

# Reaction 29 # checked
Prx2_20:
    PSO2HPSOH > PSOHPSOH
    Erythrocyte*ksrx*PSO2HPSOH

# Reaction 30 # checked
Prx2_21:
    PSO2HPSS + RR > PSO2HPSH + OR
    Erythrocyte*kred*PSO2HPSS*RR

# Reaction 31 # checked
Prx2_22:
    PSO2HPSS + RO > PSO2HPSH + OO
    Erythrocyte*kred*PSO2HPSS*RO

# Reaction 32 # checked
Prx2_23:
    PSO2HPSS > PSSPSOH
    Erythrocyte*ksrx*PSO2HPSS

# Reaction 33 # checked
Prx2_24:
    PSO2HPSO2H > PSO2HPSOH
    Erythrocyte*two_times_ksrx*PSO2HPSO2H

# Reaction 34 # checked
Prx2_1b:
    H2O2 + iPSHPSH > iPSOHPSH
    Erythrocyte*kprx*iPSHPSH*H2O2

# Reaction 35 # checked
Prx2_2b:
    iPSOHPSH > iPSSPSH
    Erythrocyte*kcond*iPSOHPSH

# Reaction 36 # checked
Prx2_4b:
    H2O2 + iPSOHPSH > iPSO2HPSH
    Erythrocyte*ksulf*iPSOHPSH*H2O2

# Reaction 37 # checked
Prx2_17b:
    iPSO2HPSH > iPSOHPSH
    Erythrocyte*ksrx*iPSO2HPSH

# Reaction 38 # checked
Prx2_6b:
    RR + iPSSPSH > OR + iPSHPSH
    Erythrocyte*kred*iPSSPSH*RR

# Reaction 39 # checked
Prx2_7b:
    RO + iPSSPSH > iPSHPSH + OO
    Erythrocyte*kred*iPSSPSH*RO

# Reaction 40 # checked
Prx2_inac1:
    PSHPSH = iPSHPSH
    Erythrocyte*(kPrx2Inactiv*PSHPSH-kPrx2Activ*iPSHPSH)

# Reaction 41 # checked
Prx2_inac2:
    PSOHPSH = iPSOHPSH
    Erythrocyte*(kPrx2Inactiv*PSOHPSH-kPrx2Activ*iPSOHPSH)

# Reaction 42 # checked
Prx2_inac3:
    PSSPSH = iPSSPSH
    Erythrocyte*(kPrx2Inactiv*PSSPSH-kPrx2Activ*iPSSPSH)

# Reaction 43 # checked
Prx2_inac4:
    PSO2HPSH = iPSO2HPSH
    Erythrocyte*(kPrx2Inactiv*PSO2HPSH-kPrx2Activ*iPSO2HPSH)

# Reaction 44 # checked
Prx2_inac5:
    iPSHPSH = iPSHiPSH
    Erythrocyte*(kPrx2Inactiv*iPSHPSH-kPrx2Activ*iPSHiPSH)

# Reaction 45 # checked
TrxR:
    OR + NADPHfree > NADPfree + RR
    Erythrocyte*TrxR_1(VMaxTrxR,KMNADPHTrxR,KMOR,NADPHfree,OR)

# Reaction 46 # checked
Trx_1:
    RR + OO > {2.0}RO
    Erythrocyte*ktrx_div_Ktrx1*OO*RR

# Reaction 47 # checked
Trx_2:
    {2.0}RO > RR + OO
    Erythrocyte*two_times_ktrx*pow(RO,2.0)

# Reaction 48 # checked
Trx_4:
    OR + RO > RR + OO
    Erythrocyte*ktrx*OR*RO

# Reaction 49 # checked
Trx_5:
    RR + OO > {2.0}OR
    Erythrocyte*ktrx*OO*RR

# Reaction 50 #  checked
Trx_6:
    {2.0}OR > RR + OO
    Erythrocyte*two_times_ktrx_div_Ktrx1*pow(OR,2.0)

# Reaction 51 # checked
Trx_7:
    OR > RO
    Erythrocyte*ktrx_div_Ktrx1*OO*OR

# Reaction 52 # checked
Trx_8:
    RO > OR
    Erythrocyte*ktrx*OO*RO

# Reaction 53 # checked
Trx_9:
    RO > OR
    Erythrocyte*ktrx*RR*RO

# Reaction 54 # checked
Trx_10:
    OR > RO
    Erythrocyte*ktrx_div_Ktrx1*RR*OR

# Reaction 55 # checked
Trx_11:
    OO + NADPHfree > NADPfree + RO
    Erythrocyte*TrxR2_1(VMaxTrxR,KMNADPHTrxR,KMOO,OO,NADPHfree)

# Reaction 56 # checked
NADP_reduction:
    NADPfree > NADPHfree
    Erythrocyte*Henri_Michaelis_Menten__irreversible__1(NADP_reduction_Km,NADP_reduction_V,NADPfree)

# Reaction 57 # checked
NADPH_sequestration:
    NADPHfree = NADPHbound
    Erythrocyte*(k_NADPHsequest*NADPHfree-k__sequest*NADPHbound)

# Reaction 58 # checked
NADP_sequestration:
    NADPfree = NADPbound
    Erythrocyte*(k_NADPsequest*NADPfree-k__sequest*NADPbound)


# Assignment rules used in reactions
# most are redundant in the sense that they are simple
# relationships of other parameters (e.g. two_times_kprx)

!F two_times_kprx = 2.0*init_for_kprx
!F two_times_kcond = 2.0*init_for_kcond
!F two_times_ktrx = 2.0*init_for_ktrx
!F two_times_kred = 2.0*init_for_kred
!F ktrx_div_Ktrx1 = init_for_ktrx/init_for_KTrx1
!F two_times_ktrx_div_Ktrx1 = init_for_two_times_ktrx/init_for_KTrx1
!F KMOO = 1000.0*KMOR
!F k_NADPsequest = init_for_k__sequest*init_for_KNADPsequest
!F k_NADPHsequest = init_for_k__sequest*init_for_KNADPHsequest
!F kPrx2Inactiv = init_for_kPrx2Activ*init_for_KPrx2
!F two_times_ksrx = 2.0*init_for_ksrx
!F two_times_ksulf = 2.0*init_for_ksulf

# Quantities in table 2 and other associated quantities

# 1  - VPrx2/vCat
# 2  - Fraction of inhibited Prx2
# 3  - H2O2 Concentration defined elsewhere
# 4  - t_{1/2}H2O2 (not included in model)
# 5  - d_{1/2}H2O2 (not included in model)
# 6  - Fraction of H2O2 consumed by Prx2
# 7  - Fraction of H2O2 consumed by Cat
# 8  - Fraction of H2O2 consumed by GPx (not included in model)
# 9  - NADPH Consumption
# 10 - NADPH Consumed per H2O2 eliminated
# 11 - Fraction of NADPH consumed by TrxR
# 12 - E(GSSG|GSH),V (not included in model)
# 13 - E(NADP+|NADPH),V (not included in model)
# 14 - E(Trx_ox|Trx_red),V (not included in model)
# 15 - fPSH
# 16 - fPSOH
# 17 - fPSO2H
# 18 - fPSS
# 19 - fPSSPS*H
# 20 - fPSSPSS
# 21 - fTrx1TT
# 22 - fTrx1TD
# 23 - fTrx1DT
# 24 - fTrx1DD

# 1
!F vPrx2_div_vCat = v_Prx2/v_Cat

# 2
!F f_Prx2_Inhib = (2.0*iPSHiPSH+iPSHPSH+iPSO2HPSH+iPSOHPSH+iPSSPSH)/t_PSH

# 6
!F fv_Prx2 = v_Prx2/v_H2O2_consumption
!F v_Prx2 = (Prx2_1()+Prx2_11()+Prx2_16()+Prx2_19()+Prx2_1b()+Prx2_3()+Prx2_4()+Prx2_4b()+Prx2_5()+Prx2_9())/Compartment_1

# 7
!F fv_Cat = v_Cat/v_H2O2_consumption
!F v_Cat = (Cat_1()+Cat_2())/Compartment_1

# 9
!F v_NADPH = NADP_reduction()/Erythrocyte

# 10
!F NADPH_div_H2O2 = NADP_reduction()/(Cat_1()+Cat_2()+GPx1()+Prx2_1()+Prx2_3()+Prx2_4()+Prx2_5()+Prx2_9()+Prx2_11()+Prx2_16()+Prx2_19()+Prx2_1b()+Prx2_4b())

# 11
!F f_NADPH_TrxR = TrxR()/(TrxR()+GSR())

# 15
!F f_PSH = t_PSH/(2.0*t_dimers)
!F t_PSH = 2.0*PSHPSH+2.0*iPSHPSH+PSO2HPSH+iPSO2HPSH+PSOHPSH+iPSOHPSH+PSSPSH+iPSSPSH+2.0*iPSHiPSH

# 16
!F f_PSOH = t_PSOH/(2.0*t_dimers)
!F t_PSOH = 2.0*PSOHPSOH+PSOHPSH+PSO2HPSOH+PSSPSOH+iPSOHPSH

# 17
!F f_PSO2H = t_PSO2H/(2.0*t_dimers)
!F t_PSO2H = 2.0*PSO2HPSO2H+PSO2HPSH+PSO2HPSOH+PSO2HPSS+iPSO2HPSH

# 18
!F f_PSS = t_PSS/(2.0*t_dimers)
!F t_PSS = 2.0*PSSPSS+PSSPSH+PSSPSOH+PSO2HPSS+iPSSPSH

# 19
!F f_1SS = t_1SS/t_dimers
!F t_1SS = PSSPSH+PSSPSOH+PSO2HPSS+iPSSPSH

# 20
!F f_2SS = t_2SS/t_dimers
!F t_2SS = PSSPSS

# 21
!F f_TrxRR = RR/t_Trx

# 22
!F f_TrxOR = OR/t_Trx

# 23
!F f_TrxRO = RO/t_Trx

# 24
!F f_TrxOO = OO/t_Trx

####EXTRAS (coded by carl) ############
#
#!F f_0SS = 1 - f_1SS - f_2SS
#
#!F t_0SS_US = PSHPSH + iPSHPSH + PSOHPSH + iPSOHPSH + iPSHiPSH + PSOHPSOH
#!F f_0SS_US = t_0SS_US/t_dimers
#
#!F t_0SS_S = PSO2HPSH + iPSO2HPSH + PSO2HPSOH + PSO2HPSO2H
#!F f_0SS_S = t_0SS_S/t_dimers
#
#!F t_1SS_US = PSSPSH + iPSSPSH + PSSPSOH
#!F f_1SS_US = t_1SS_US/t_dimers
#
#!F t_1SS_S =  PSO2HPSS
#!F f_1SS_S = t_1SS_S/t_dimers
#
#!F E_Trx = E0_Trx - ((310.15*8.31)/(2*96485))*ln(r_Trx)
#!F E_NADPH = E0_NADPH - ((310.15*8.31)/(2*96485))*ln(r_NADPH_free)
#!F E_GSH = E0_GSH - ((310.15*8.31)/(2*96485))*ln(r_GS)
#
#######################################

# Misc (used in above relationships)
!F v_H2O2_consumption = v_Cat+v_GPx1+v_Prx2
!F v_GPx1 = GPx1()/Compartment_1
!F t_dimers = PSHPSH+PSO2HPSH+PSO2HPSO2H+PSO2HPSOH+PSO2HPSS+PSOHPSH+PSOHPSOH+PSSPSH+PSSPSOH+PSSPSS+iPSHPSH+iPSO2HPSH+iPSOHPSH+iPSSPSH+iPSHiPSH
!F t_Trx = RR+RO+OR+OO



# Assignment rules
# None of these rules are found in any reactions
# Some may be useful, but other are probably mostly junk

!F v_H2O2_prod = H2O2_production()/Compartment_1
!F f_NADPH = NADPHfree/(NADPfree+NADPHfree)
!F f_TrxR_star = f_TrxRR+f_TrxRO
!F r_NADPH_free = NADPHfree/NADPfree
!F r_NADPH_all = (NADPHfree+NADPHbound)/(NADPfree+NADPbound)
!F f_GSH = GSH/(2.0*GSSG+GSH)
#!F r_GS = GSH*GSH/GSSG
#!F r_Trx = (RR+RO)/(OR+OO)

# Variable species
# all appear in reactions
Cpd2@Erythrocyte = 0.0
GSH@Erythrocyte = 3200.0
NADPfree@Erythrocyte = 0.1
H2O2@Erythrocyte = 0.0
Cpd1@Erythrocyte = 0.0
Ferri@Erythrocyte = 24.4
GSSG@Erythrocyte = 0.0
NADPHfree@Erythrocyte = 2.61509433962
PSHPSH@Erythrocyte = 0.0
PSOHPSH@Erythrocyte = 0.0
PSO2HPSO2H@Erythrocyte = 0.0
PSO2HPSS@Erythrocyte = 0.0
iPSSPSH@Erythrocyte = 0.0
iPSOHPSH@Erythrocyte = 0.0
iPSO2HPSH@Erythrocyte = 0.0
iPSHPSH@Erythrocyte = 0.0
iPSHiPSH@Erythrocyte = 285.0
NADPHbound@Erythrocyte = 25.1049056604
PSOHPSOH@Erythrocyte = 0.0
PSSPSOH@Erythrocyte = 0.0
PSO2HPSOH@Erythrocyte = 0.0
PSSPSS@Erythrocyte = 0.0
PSSPSH@Erythrocyte = 0.0
PSO2HPSH@Erythrocyte = 0.0
RO@Erythrocyte = 0.0
RR@Erythrocyte = 0.56
OO@Erythrocyte = 0.0
OR@Erythrocyte = 0.0
NADPbound@Erythrocyte = 0.18
eH2O2@Plasma = 0.0

# Parameters

# Reaction 1
H2O2_production_v = 0.0895
# This value is misleading: in Table 1 of the paper only the value of endogenous
# H2O2 is shown (0.035 uM.s^-1), however an a additional 0.055 uM.s^-1) of H2O2
# influx is also present. Thus the (probably unrounded) total H2O2 production
# is 0.0895 as given above.

# Reaction 4
GPx1_f1 = 0.0399 # AIP
GPx1_f2 = 9.72   # AIP

# Reaction 5
GSR_KMGSSG = 65.0 # AIP
GSR_KMNADPH = 8.5 # AIP
GSR_VMax = 49.0   # AIP

# Reaction 6
Cat_1_k1 = 6.0 # AIP

# Reaction 7
Cat_2_k1 = 18.0 # AIP

# Reaction 8
Cat_3_k1 = 0.011 # AIP

# Reaction 9
Cat_4_k1 = 73900.0 # AIP

# Reaction 10*, 12, 14, 25, 34
# called kox in paper
kprx = 100.0 # AIP
two_times_kprx = 200.0 # (rule)
init_for_kprx = 100.0 # API

# Reaction 11, 17, 19, 27, 35
kcond = 1.7 # AIP
two_times_kcond = 3.4   # (rule)
init_for_kcond = 1.7

# Reaction 13, 18*, 20, 28, 36
ksulf = 0.012 # AIP
two_times_ksulf = 0.024 # (rule)
init_for_ksulf = 0.012

# Reaction 15, 16, 21, 22, 23*, 24*, 30, 31, 38, 39
kred = 0.21 # AIP
two_times_kred = 0.42  # (rule)

# Reaction 26, 29, 32, 33*, 37
ksrx = 0.0001 # AIP
two_times_ksrx = 0.0002   # (rule)

ktrx = 0.21
two_times_ktrx = 0.42 # (rule)


kPrx2Activ = 10000000.0
init_for_kPrx2Activ = 10000000.0
init_for_KPrx2 = 166.9

# Rate rule only parameters (i.e. not really needed)

NADP_reduction_Km = 0.45
NADP_reduction_V = 2.4
VMaxTrxR = 10.0
KMNADPHTrxR = 6.0
k__sequest = 10000000.0
KMOR = 1.83
KNADPHsequest = 9.6
KNADPsequest = 1.8
Compartment_1 = 7.17e-14
#E_NADPH = -0.363658610709
NADPtot = 28.0
Trxtot = 0.56
Prx2tot = 285.0
GStot = 3200.0
Cattot = 24.4
init_for_KTrx1 = 50.0
init_for_ksrx = 0.0001
init_for_kred = 0.21
E0_Trx = -0.23
E0_GSH = -0.24
#E_Trx = -inf
#E_GSH = -inf
KTrx1 = 50.0
init_for_ktrx = 0.21
E0_NADPH = -0.32
KPrx2 = 166.9
init_for_KNADPsequest = 1.8
init_for_k__sequest = 10000000.0
init_for_KNADPHsequest = 9.6


v_GPx1 = 0.0  # (rule)
ktrx_div_Ktrx1 = 0.0042   # (rule)
two_times_ktrx_div_Ktrx1 = 0.0084   # (rule)
KMOO = 1830.0   # (rule)
k_NADPsequest = 18000000.0   # (rule)
k_NADPHsequest = 96000000.0   # (rule)
kPrx2Inactiv = 1669000000.0 # (rule)
f_PSO2H = 0.0  # (rule)
v_H2O2_prod = 0.0  # (rule)
v_H2O2_consumption = 0.0  # (rule)
v_Cat = 0.0  # (rule)
f_NADPH = 0.963168867269   # (rule)
v_Prx2 = 0.0  # (rule)
f_PSS = 0.0  # (rule)
f_1SS = 0.0  # (rule)
t_dimers = 285.0    # (rule)
t_1SS = 0.0  # (rule)
t_2SS = 0.0  # (rule)
f_PSOH = 0.0  # (rule)
init_for_two_times_ktrx = 0.42
t_PSO2H = 0.0  # (rule)
f_PSH = 1.0  # (rule)
f_TrxOO = 0.0  # (rule)
f_TrxOR = 0.0  # (rule)
v_NADPH = 0.0  # (rule)
f_TrxR_star = 1.0  # (rule)
t_Trx = 0.56 # (rule)
f_2SS = 0.0  # (rule)
f_TrxRO = 0.0  # (rule)
f_TrxRR = 1.0  # (rule)
fv_Cat = 0.0  # (rule)
f_NADPH_TrxR = 0.0  # (rule)
NADPH_div_H2O2 = 0.0  # (rule)
r_NADPH_free = 26.1509433962    # (rule)
r_NADPH_all = 99.0 # (rule)
#r_GS = inf  # (rule)
f_GSH = 1.0  # (rule)
#r_Trx = inf  # (rule)
f_Prx2_Inhib = 1.0  # (rule)
t_PSS = 0.0  # (rule)
vPrx2_div_vCat = 0.0  # (rule)
fv_Prx2 = 0.0  # (rule)
t_PSH = 570.0    # (rule)
t_PSOH = 0.0  # (rule)
