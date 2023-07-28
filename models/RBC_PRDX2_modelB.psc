#Replaced from Benfeitas supplied model
#PSHPSH with PrxSH_PrxSH
#PSOHPSH with PrxSH_PrxSOH
#PSSPSH with PrxSH_PrxSS
#PSSPSOH with PrxSOH_PrxSS
#PSOHPSOH with PrxSOH_PrxSOH
#PSO2HPSH with PrxSH_PrxSO2H
#PSO2HPSOH with PrxSOH_PrxSO2H
#PSO2HPSS with PrxSS_PrxSO2H
#PSO2HPSO2H with PrxSO2H_PrxSO2H
#PSSPSS with PrxSS_PrxSS

#iPSHPSH with iPrxSH_PrxSH
#iPSHiPSH with iPrxSH_iPrxSH
#iPSSPSH with iPrxSH_PrxSS
#iPSOHPSH with iPrxSH_PrxSOH
#iPSO2HPSH with iPrxSH_PrxSO2H

#Prx2_1 with Prx_R_R_ox
#Prx2_5 with Prx_R_S_ox
#Prx2_3 with Prx_R_O_ox
#Prx2_16 with Prx_R_O2_ox
#Prx2_1b with iPrx_R_R_ox

#Prx2_9 with Prx_O_O_oox
#Prx2_11 with Prx_O_S_oox
#Prx2_4 with Prx_R_O_oox
#Prx2_19 with Prx_O_O2_oox
#Prx2_4b with iPrx_R_O_oox

#Prx2_2: with Prx_R_O_disulf_form:
#Prx2_8: with Prx_O_O_disulf_form:
#Prx2_10: with Prx_O_S_disulf_form:
#Prx2_18: with Prx_O_O2_disulf_form:
#Prx2_2b: with iPrx_S_O2_disulf_form:

#Prx2_6: with Prx_R_S_red:
#Prx2_7: with Prx_R_S_red:
#Prx2_12: with Prx_O_S_red:
#Prx2_13: with Prx_O_S_red_Trx1SH_Trx2SOH:
#Prx2_14: with Prx_S_S_red_RR:
#Prx2_15: with Prx_S_S_red_Trx1SH_Trx2SOH:
#Prx2_21: with Prx_S_O2_red_RR:

#RR with Trx1SH_Trx2SH
#RO with Trx1SH_Trx2SOH
#OR with Trx1SOH_Trx2SH
#OO with Trx1SOH_Trx2SOH

#TrxR with Trx_red1
#Trx_11 with Trx_red2

#NADPH with NADPHfree - This is a work-around for a Pysces bug
#NADP with NADPfree - This is a work-around for a Pysces bug

# Keywords
Description: H2O2 metabolism
Modelname: RBC_PRDX2_modelB
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
H2O2*GSH/(GSH*f1+H2O2*f2)}

Function: TrxR2_1, VMaxTrxR , KMNADPHTrxR , KMTrx1SOH_Trx2SOH , Trx1SOH_Trx2SOH , NADPHfree  {
VMaxTrxR*NADPHfree*Trx1SOH_Trx2SOH/(Trx1SOH_Trx2SOH*NADPHfree+KMNADPHTrxR*Trx1SOH_Trx2SOH+NADPHfree*KMTrx1SOH_Trx2SOH)}

Function: Henri_Michaelis_Menten__irreversible__1, Km , V , NADPfree  {
V*NADPfree/(Km+NADPfree)}

Function: GSR_1, KMGSSG , KMNADPH , VMax , GSSG , NADPHfree  {
VMax*NADPHfree*GSSG/(GSSG*NADPHfree+GSSG*KMNADPH+NADPHfree*KMGSSG)}

Function: Constant_flux__irreversible, v  {
v}

Function: Henri_Michaelis_Menten__irreversible, substrate , Km , V  {
V*substrate/(Km+substrate)}

Function: TrxR_1, VMaxTrxR , KMNADPHTrxR , KMTrx1SOH_Trx2SH , NADPHfree , Trx1SOH_Trx2SH  {
VMaxTrxR*NADPHfree*Trx1SOH_Trx2SH/(Trx1SOH_Trx2SH*NADPHfree+KMNADPHTrxR*Trx1SOH_Trx2SH+NADPHfree*KMTrx1SOH_Trx2SH)}

# FIX: H2O2 NADPHfree NADPfree 

### Reactions

# Oxidation reactions
Prx_R_R_ox:
    SH_SH + H2O2 > SH_SOH
    Erythrocyte*two_times_kprx*SH_SH*H2O2 # && two_times_kprx = 200

Prx_R_S_ox:
    SH_SS + H2O2 > SOH_SS
    Erythrocyte*kprx*SH_SS*H2O2

Prx_R_O_ox:
    SH_SOH + H2O2 > SOH_SOH
    Erythrocyte*kprx*SH_SOH*H2O2

Prx_R_O2_ox:
    H2O2 + SH_SO2H > SOH_SO2H
    Erythrocyte*kprx*SH_SO2H*H2O2

iPrx_R_R_ox:
    H2O2 + iSH_SH > iSH_SOH
    Erythrocyte*kprx*iSH_SH*H2O2

# Over-oxidation reactions
Prx_O_O_oox:
    H2O2 + SOH_SOH > SOH_SO2H
    Erythrocyte*two_times_ksulf*SOH_SOH*H2O2

Prx_O_S_oox:
    H2O2 + SOH_SS > SS_SO2H
    Erythrocyte*ksulf*SOH_SS*H2O2

Prx_R_O_oox:
    SH_SOH + H2O2 > SH_SO2H
    Erythrocyte*ksulf*SH_SOH*H2O2

Prx_O_O2_oox:
    SOH_SO2H + H2O2 > SO2H_SO2H
    Erythrocyte*ksulf*SOH_SO2H*H2O2

# Reaction 36 # checked
iPrx_R_O_oox:
    H2O2 + iSH_SOH > iSH_SO2H
    Erythrocyte*ksulf*iSH_SOH*H2O2

# Disulphide bridge formation
Prx_R_O_disulf_form:
    SH_SOH > SH_SS
    Erythrocyte*kcond*SH_SOH

Prx_O_O_disulf_form:
    SOH_SOH > SOH_SS
    Erythrocyte*two_times_kcond*SOH_SOH

Prx_O_S_disulf_form:
    SOH_SS > SS_SS
    Erythrocyte*kcond*SOH_SS

Prx_O_O2_disulf_form:
    SOH_SO2H > SS_SO2H
    Erythrocyte*kcond*SOH_SO2H

iPrx_S_O2_disulf_form:
    iSH_SOH > iSH_SS
    Erythrocyte*kcond*iSH_SOH

# Disulphide bridge reduction via Thioredoxin
Prx_R_S_red__Trx1SH_Trx2SH:
    SH_SS + Trx1SH_Trx2SH > SH_SH + Trx1SOH_Trx2SH
    Erythrocyte*kred*SH_SS*Trx1SH_Trx2SH

Prx_R_S_red_Trx1SH_Trx2SOH:
    SH_SS + Trx1SH_Trx2SOH > SH_SH + Trx1SOH_Trx2SOH
    Erythrocyte*kred*SH_SS*Trx1SH_Trx2SOH

Prx_O_S_red_Trx1SH_Trx2SH:
    SOH_SS + Trx1SH_Trx2SH > SH_SOH + Trx1SOH_Trx2SH
    Erythrocyte*kred*SOH_SS*Trx1SH_Trx2SH

Prx_O_S_red_Trx1SH_Trx2SOH:
    Trx1SH_Trx2SOH + SOH_SS > SH_SOH + Trx1SOH_Trx2SOH
    Erythrocyte*kred*SOH_SS*Trx1SH_Trx2SOH

Prx_S_S_red_Trx1SH_Trx2SH:
    SS_SS + Trx1SH_Trx2SH > SH_SS + Trx1SOH_Trx2SH
    Erythrocyte*two_times_kred*SS_SS*Trx1SH_Trx2SH

Prx_S_S_red_Trx1SH_Trx2SOH:
    SS_SS + Trx1SH_Trx2SOH > SH_SS + Trx1SOH_Trx2SOH
    Erythrocyte*two_times_kred*SS_SS*Trx1SH_Trx2SOH

Prx_S_O2_red_Trx1SH_Trx2SH:
    SS_SO2H + Trx1SH_Trx2SH > SH_SO2H + Trx1SOH_Trx2SH
    Erythrocyte*kred*SS_SO2H*Trx1SH_Trx2SH

Prx_S_O2_red_Trx1SH_Trx2SOH:
    SS_SO2H + Trx1SH_Trx2SOH > SH_SO2H + Trx1SOH_Trx2SOH
    Erythrocyte*kred*SS_SO2H*Trx1SH_Trx2SOH

iPrx_R_S_red_Trx1SH_Trx2SH:
    iSH_SS + Trx1SH_Trx2SH > Trx1SOH_Trx2SH + iSH_SH
    Erythrocyte*kred*iSH_SS*Trx1SH_Trx2SH

iPrx_R_S_red_Trx1SH_Trx2SOH:
    iSH_SS +Trx1SH_Trx2SOH > iSH_SH + Trx1SOH_Trx2SOH
    Erythrocyte*kred*iSH_SS*Trx1SH_Trx2SOH

# Overoxidised Prx reduction via sulphredoxin
Prx_R_O2_srx:
    SH_SO2H > SH_SOH
    Erythrocyte*ksrx*SH_SO2H

Prx_O_O2_srx:
    SOH_SO2H > SOH_SOH
    Erythrocyte*ksrx*SOH_SO2H

iPrx_R_O2_srx:
    iSH_SO2H > iSH_SOH
    Erythrocyte*ksrx*iSH_SO2H

Prx_S_O2_srx:
    SS_SO2H > SOH_SS
    Erythrocyte*ksrx*SS_SO2H

Prx_O2_O2_srx:
    SO2H_SO2H > SOH_SO2H
    Erythrocyte*two_times_ksrx*SO2H_SO2H

# Inactivation
Prx_R_R_inac:
    SH_SH = iSH_SH
    Erythrocyte*(kPrx2Inactiv*SH_SH-kPrx2Activ*iSH_SH)

Prx_R_O_inac:
    SH_SOH = iSH_SOH
    Erythrocyte*(kPrx2Inactiv*SH_SOH-kPrx2Activ*iSH_SOH)

Prx_R_S_inac:
    SH_SS = iSH_SS
    Erythrocyte*(kPrx2Inactiv*SH_SS-kPrx2Activ*iSH_SS)

Prx_R_O2_inac:
    SH_SO2H = iSH_SO2H
    Erythrocyte*(kPrx2Inactiv*SH_SO2H-kPrx2Activ*iSH_SO2H)

Prx_iR_R_inac:
    iSH_SH = iSH_iSH
    Erythrocyte*(kPrx2Inactiv*iSH_SH-kPrx2Activ*iSH_iSH)

# Trx regeneration
Trx_red1:
    Trx1SOH_Trx2SH + NADPHfree > NADPfree + Trx1SH_Trx2SH
    Erythrocyte*TrxR_1(VMaxTrxR,KMNADPHTrxR,KMTrx1SOH_Trx2SH,NADPHfree,Trx1SOH_Trx2SH)

Trx_red2:
    Trx1SOH_Trx2SOH + NADPHfree > NADPfree + Trx1SH_Trx2SOH
    Erythrocyte*TrxR2_1(VMaxTrxR,KMNADPHTrxR,KMTrx1SOH_Trx2SOH,Trx1SOH_Trx2SOH,NADPHfree)

# Trx switches
Trx_R_R_Trx_O_O_swi:
    Trx1SH_Trx2SH + Trx1SOH_Trx2SOH > {2.0}Trx1SH_Trx2SOH
    Erythrocyte*ktrx_div_Ktrx1*Trx1SOH_Trx2SOH*Trx1SH_Trx2SH

Trx_R_O_Trx_R_O_swi:
    {2.0}Trx1SH_Trx2SOH > Trx1SH_Trx2SH + Trx1SOH_Trx2SOH
    Erythrocyte*two_times_ktrx*pow(Trx1SH_Trx2SOH,2.0)

Trx_O_R_Trx_R_O_swi:
    Trx1SOH_Trx2SH + Trx1SH_Trx2SOH > Trx1SH_Trx2SH + Trx1SOH_Trx2SOH
    Erythrocyte*ktrx*Trx1SOH_Trx2SH*Trx1SH_Trx2SOH

Trx_R_R_Trx_R_O_swi:
    Trx1SH_Trx2SH + Trx1SOH_Trx2SOH > {2.0}Trx1SOH_Trx2SH
    Erythrocyte*ktrx*Trx1SOH_Trx2SOH*Trx1SH_Trx2SH

Trx_O_R_Trx_O_R_swi:
    {2.0}Trx1SOH_Trx2SH > Trx1SH_Trx2SH + Trx1SOH_Trx2SOH
    Erythrocyte*two_times_ktrx_div_Ktrx1*pow(Trx1SOH_Trx2SH,2.0)

Trx_O_R_swi:
    Trx1SOH_Trx2SH > Trx1SH_Trx2SOH
    Erythrocyte*ktrx_div_Ktrx1*Trx1SOH_Trx2SOH*Trx1SOH_Trx2SH

Trx_R_O_swi:
    Trx1SH_Trx2SOH > Trx1SOH_Trx2SH
    Erythrocyte*ktrx*Trx1SOH_Trx2SOH*Trx1SH_Trx2SOH

Trx_R_O_swi1:
    Trx1SH_Trx2SOH > Trx1SOH_Trx2SH
    Erythrocyte*ktrx*Trx1SH_Trx2SH*Trx1SH_Trx2SOH

Trx_O_R_swi2:
    Trx1SOH_Trx2SH > Trx1SH_Trx2SOH
    Erythrocyte*ktrx_div_Ktrx1*Trx1SH_Trx2SH*Trx1SOH_Trx2SH

# Catalase
Cat_1:
    H2O2 + Ferri > Cpd1
    Erythrocyte*Cat_1_k1*Ferri*H2O2

Cat_2:
    H2O2 + Cpd1 > Ferri
    Erythrocyte*Cat_2_k1*Cpd1*H2O2

Cat_3:
    Cpd1 > Cpd2
    Erythrocyte*Cat_3_k1*Cpd1

Cat_4:
    Cpd2 > Ferri
    Erythrocyte*Cat_4_k1*Cpd2

# Glutathione peroxidase
GPx1:
    {2.0}GSH + H2O2 > GSSG
    Erythrocyte*GPx1_1(GPx1_f1,GPx1_f2,H2O2,GSH)

GSR:
    GSSG + NADPHfree > {2.0}GSH + NADPfree
    Erythrocyte*GSR_1(GSR_KMGSSG,GSR_KMNADPH,GSR_VMax,GSSG,NADPHfree)

# NADPH regeneration
NADP_reduction:
    NADPfree > NADPHfree 
    Erythrocyte*Henri_Michaelis_Menten__irreversible__1(NADP_reduction_Km,NADP_reduction_V,NADPfree)

NADPH_sequestration:
    NADPHfree = NADPHbound
    Erythrocyte*(k_NADPHsequest*NADPHfree-k__sequest*NADPHbound)

NADP_sequestration:
    NADPfree = NADPbound
    Erythrocyte*(k_NADPsequest*NADPfree-k__sequest*NADPbound)

H2O2_production:
    $pool > H2O2
    Erythrocyte*Constant_flux__irreversible(H2O2_production_v)

H2O2_permeation:
    eH2O2 = H2O2
    eH2O2*H2O2_perm - H2O2*H2O2_perm

!F extH2O2 = eH2O2*unfix_eH2O2 + exH2O2_pulse_conc*fix_eH2O2
fix_eH2O2 = 0
unfix_eH2O2 = 1

!F eH2O2 = extH2O2

# H2O2 pulse
Event: eH2O2pulse_start, _TIME_< exH2O2_pulse_length and do_exH2O2_pulse == True, 5{
fix_eH2O2 =  1 
unfix_eH2O2 = 0 
}
Event: eH2O2pulse_end, _TIME_ > exH2O2_pulse_length and do_exH2O2_pulse == True, 5{
fix_eH2O2 =  0
unfix_eH2O2 = 1
eH2O2 = 0
}
exH2O2_pulse_length = 0
exH2O2_pulse_conc = 0
do_exH2O2_pulse = False

### Parameters
## Dimer parameters
# Assignment rules used in reactions
# most are redundant in the sense that they are simple
# relationships of other parameters (e.g. two_times_kprx)

!F two_times_kprx = 2.0*init_for_kprx
!F two_times_kcond = 2.0*init_for_kcond
!F two_times_ktrx = 2.0*init_for_ktrx
!F two_times_kred = 2.0*init_for_kred
!F ktrx_div_Ktrx1 = init_for_ktrx/init_for_KTrx1
!F two_times_ktrx_div_Ktrx1 = init_for_two_times_ktrx/init_for_KTrx1
!F KMTrx1SOH_Trx2SOH = 1000.0*KMTrx1SOH_Trx2SH
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
# 20 - fPrxSS_PrxSS
# 21 - fTrx1TT
# 22 - fTrx1TD
# 23 - fTrx1DT
# 24 - fTrx1DD

# 1
#!F vPrx2_div_vCat = v_Prx2/v_Cat

# 2
!F f_Prx2_Inhib = (2.0*iSH_iSH+iSH_SH+iSH_SO2H+iSH_SOH+iSH_SS)/t_PSH

# 6
#!F fv_Prx2 = v_Prx2/v_H2O2_consumption
!F v_Prx2 = (Prx_R_R_ox()+Prx_O_S_oox()+Prx_R_O2_ox()+Prx_O_O2_oox()+iPrx_R_R_ox()+Prx_R_O_ox()+Prx_R_O_oox()+iPrx_R_O_oox()+Prx_R_S_ox()+Prx_O_O_oox())/Erythrocyte
# above originally /Compartment_1

# 7
#!F fv_Cat = v_Cat/v_H2O2_consumption
!F v_Cat = (Cat_1()+Cat_2())/Erythrocyte
# above originally /Compartment_1

# 9
#!F v_NADPH = NADP_reduction()/Erythrocyte
!F v_NADPH = (Trx_red1() + Trx_red2())/Erythrocyte 
# This makes more sense than the original

# 10
!F NADPH_div_H2O2 = NADP_reduction()/(Cat_1()+Cat_2()+GPx1()+Prx_R_R_ox()+Prx_R_O_ox()+Prx_R_O_oox()+Prx_R_S_ox()+Prx_O_O_oox()+Prx_O_S_oox()+Prx_R_O2_ox()+Prx_O_O2_oox()+iPrx_R_R_ox()+iPrx_R_O_oox())

# 11
!F f_NADPH_TrxR = Trx_red1()/(Trx_red1()+GSR())

# 15
!F f_PSH = t_PSH/(2.0*t_dimers)
!F t_PSH = 2.0*SH_SH+2.0*iSH_SH+SH_SO2H+iSH_SO2H+SH_SOH+iSH_SOH+SH_SS+iSH_SS+2.0*iSH_iSH

# 16
!F f_PSOH = t_PSOH/(2.0*t_dimers)
!F t_PSOH = 2.0*SOH_SOH+SH_SOH+SOH_SO2H+SOH_SS+iSH_SOH

# 17
!F f_PSO2H = t_PSO2H/(2.0*t_dimers)
!F t_PSO2H = 2.0*SO2H_SO2H+SH_SO2H+SOH_SO2H+SS_SO2H+iSH_SO2H

# 18
!F f_PSS = t_PSS/(2.0*t_dimers)
!F t_PSS = 2.0*SS_SS+SH_SS+SOH_SS+SS_SO2H+iSH_SS

# 19
!F f_1SS = t_1SS/t_dimers
!F t_1SS = SH_SS+SOH_SS+SS_SO2H+iSH_SS

# 20
!F f_2SS = t_2SS/t_dimers
!F t_2SS = SS_SS

# 21
!F f_TrxRR = Trx1SH_Trx2SH/t_Trx

# 22
!F f_TrxOR = Trx1SOH_Trx2SH/t_Trx

# 23
!F f_TrxRO = Trx1SH_Trx2SOH/t_Trx

# 24
!F f_TrxOO = Trx1SOH_Trx2SOH/t_Trx


# Misc (used in above relationships)
!F v_H2O2_consumption = v_Cat+v_GPx1+v_Prx2
!F v_GPx1 = GPx1()/Erythrocyte
# above originally /Compartment_1
!F t_dimers = SH_SH+SH_SO2H+SO2H_SO2H+SOH_SO2H+SS_SO2H+SH_SOH+SOH_SOH+SH_SS+SOH_SS+SS_SS+iSH_SH+iSH_SO2H+iSH_SOH+iSH_SS+iSH_iSH
!F t_Trx = Trx1SH_Trx2SH+Trx1SH_Trx2SOH+Trx1SOH_Trx2SH+Trx1SOH_Trx2SOH

# Assignment rules
# None of these rules are found in any reactions
# Some may be useful, but other are probably mostly junk

!F v_H2O2_prod = H2O2_production()/Erythrocyte
# above originally /Compartment_1
!F f_NADPH = NADPHfree/(NADPfree+NADPHfree )
!F f_TrxR_star = f_TrxRR+f_TrxRO
!F r_NADPH = NADPHfree/NADPfree
!F r_NADPH_all = (NADPHfree+NADPHbound)/(NADPfree+NADPbound)
!F f_GSH = GSH/(2.0*GSSG+GSH)
#!F r_GS = GSH*GSH/GSSG
#!F r_Trx = (Trx1SH_Trx2SH+Trx1SH_Trx2SOH)/(Trx1SOH_Trx2SH+Trx1SOH_Trx2SOH)

### Species (Flag for scripting)
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
SH_SH@Erythrocyte = 0.0
SH_SOH@Erythrocyte = 0.0
SO2H_SO2H@Erythrocyte = 0.0
SS_SO2H@Erythrocyte = 0.0
iSH_SS@Erythrocyte = 0.0
iSH_SOH@Erythrocyte = 0.0
iSH_SO2H@Erythrocyte = 0.0
iSH_SH@Erythrocyte = 0.0
iSH_iSH@Erythrocyte = 285.0
NADPHbound@Erythrocyte = 25.1049056604
SOH_SOH@Erythrocyte = 0.0
SOH_SS@Erythrocyte = 0.0
SOH_SO2H@Erythrocyte = 0.0
SS_SS@Erythrocyte = 0.0
SH_SS@Erythrocyte = 0.0
SH_SO2H@Erythrocyte = 0.0
Trx1SH_Trx2SOH@Erythrocyte = 0.0
Trx1SH_Trx2SH@Erythrocyte = 0.56
Trx1SOH_Trx2SOH@Erythrocyte = 0.0
Trx1SOH_Trx2SH@Erythrocyte = 0.0
NADPbound@Erythrocyte = 0.18
eH2O2@Plasma = 0 # Added by Chris
extH2O2@Plasma = 0 # (rule) Added by Johann

# Parameters

# Reaction 1
H2O2_production_v = 0.0895 # 3.5e-8 paper - Carl # 3.5e-8 (or 0.057 for fig 3) for internal production + 55 nM.s for influx - Chris 

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

H2O2_perm = 10.9 # Added by Chris

kPrx2Activ = 10000000.0
init_for_kPrx2Activ = 10000000.0
init_for_KPrx2 = 166.9

# Rate rule only parameters (i.e. not really needed)

NADP_reduction_Km = 0.45
NADP_reduction_V = 2.4
VMaxTrxR = 10.0
KMNADPHTrxR = 6.0
k__sequest = 10000000.0
KMTrx1SOH_Trx2SH = 1.83
KNADPHsequest = 9.6
KNADPsequest = 1.8
Compartment_1 = 7.17e-14
E_NADPH = -0.363658610709
NADPtot = 28.0
Trxtot = 0.56
Prx2tot = 285.0
GStot = 3200.0
Cattot = 24.4
init_for_KTrx1 = 50.0
init_for_ksrx = 0.0001
init_for_kred = 0.21
E0_Trx = -0.23
E0_GSH = -0.24 # for pH 7.0 - Chris
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
KMTrx1SOH_Trx2SOH = 1830.0   # (rule)
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

### References (Flag for scripting)

### End (Flag for scripting)
