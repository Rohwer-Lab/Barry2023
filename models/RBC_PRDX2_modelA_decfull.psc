








Description: H2O2 metabolism
Modelname: RBC_PRDX2_modelA
Output_In_Conc: True
Species_In_Conc: True

UnitVolume: litre, 1.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: mole, 1.0, -6, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: second, 1.0, 0, 1

Compartment: Erythrocyte, 1.0, 3
Compartment: Plasma, 1.70153417015, 3

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



Prx_R_R_ox:
    SH_SH + H2O2 > SH_SOH
    Erythrocyte*two_times_kprx*SH_SH*H2O2

Prx_R_S_ox:
    SH_SS + H2O2 > SOH_SS
    Erythrocyte*kprx*SH_SS*H2O2

Prx_R_O_ox:
    SH_SOH + H2O2 > SOH_SOH
    Erythrocyte*kprx*SH_SOH*H2O2

Prx_R_O2_ox:
    H2O2 + SH_SO2H > SOH_SO2H
    Erythrocyte*kprx*SH_SO2H*H2O2

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

Prx_R_O2_srx:
    SH_SO2H > SH_SOH
    Erythrocyte*ksrx*SH_SO2H

Prx_O_O2_srx:
    SOH_SO2H > SOH_SOH
    Erythrocyte*ksrx*SOH_SO2H

Prx_S_O2_srx:
    SS_SO2H > SOH_SS
    Erythrocyte*ksrx*SS_SO2H

Prx_O2_O2_srx:
    SO2H_SO2H > SOH_SO2H
    Erythrocyte*two_times_ksrx*SO2H_SO2H

Trx_red1:
    Trx1SOH_Trx2SH + NADPHfree > NADPfree + Trx1SH_Trx2SH
    Erythrocyte*TrxR_1(VMaxTrxR,KMNADPHTrxR,KMTrx1SOH_Trx2SH,NADPHfree,Trx1SOH_Trx2SH)

Trx_red2:
    Trx1SOH_Trx2SOH + NADPHfree > NADPfree + Trx1SH_Trx2SOH
    Erythrocyte*TrxR2_1(VMaxTrxR,KMNADPHTrxR,KMTrx1SOH_Trx2SOH,Trx1SOH_Trx2SOH,NADPHfree)

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

GPx1:
    {2.0}GSH + H2O2 > GSSG
    Erythrocyte*GPx1_1(GPx1_f1,GPx1_f2,H2O2,GSH)

GSR:
    GSSG + NADPHfree > {2.0}GSH + NADPfree
    Erythrocyte*GSR_1(GSR_KMGSSG,GSR_KMNADPH,GSR_VMax,GSSG,NADPHfree)

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

## Decamer reactions

Decamer_disassociation:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SH = {5}SH_SH
	k_Prx_dec_disasso*SH_SH__SH_SH__SH_SH__SH_SH__SH_SH - k_Prx_asso*SH_SH**exponent

# Sulfenilation - decamer

R1_ox:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SH + H2O2 > SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH
	10*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SH_SH*H2O2

R2_ox:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH*H2O2

R3_ox:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH*H2O2

R4_ox:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH*H2O2

R5_ox:
	SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH*H2O2

R6_ox:
	SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH*H2O2

R7_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH*H2O2

R8_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH*H2O2

R9_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH*H2O2

R10_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH*H2O2

R11_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH*H2O2

R12_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH*H2O2

R13_ox:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH*H2O2

R14_ox:
	SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH*H2O2

R15_ox:
	SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH*H2O2

R16_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH*H2O2

R17_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH*H2O2

R18_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH*H2O2

R19_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH*H2O2

R20_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH*H2O2

R21_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH*H2O2

R22_ox:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH*H2O2

R23_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH*H2O2

R24_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH*H2O2

R25_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH*H2O2

R26_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R27_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R28_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R29_ox:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R30_ox:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R31_ox:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R32_ox:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R33_ox:
	SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R34_ox:
	SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R35_ox:
	SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R36_ox:
	SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R37_ox:
	SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH*H2O2

R38_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH*H2O2

R39_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH*H2O2

R40_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH*H2O2

R41_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH*H2O2

R42_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH*H2O2

R43_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH*H2O2

R44_ox:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH*H2O2

R45_ox:
	SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH*H2O2

R46_ox:
	SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH*H2O2

R47_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH*H2O2

R48_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH*H2O2

R49_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH*H2O2

R50_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH*H2O2

R51_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH*H2O2

R52_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R53_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R54_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R55_ox:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R56_ox:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R57_ox:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R58_ox:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R59_ox:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R60_ox:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R61_ox:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R62_ox:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R63_ox:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R64_ox:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R65_ox:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH*H2O2

R66_ox:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH*H2O2

R67_ox:
	SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH*H2O2

R68_ox:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R69_ox:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R70_ox:
	SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH*H2O2

R71_ox:
	SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH*H2O2

R72_ox:
	SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH
	4*k_Prx_sulfe_SH_dec*SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH*H2O2

R73_ox:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R74_ox:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R75_ox:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R76_ox:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R77_ox:
	SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R78_ox:
	SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R79_ox:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH
	5*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SOH*H2O2

R80_ox:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R81_ox:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH*H2O2

R82_ox:
	SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R83_ox:
	SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R84_ox:
	SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R85_ox:
	SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_sulfe_SH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH*H2O2

R86_ox:
	SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R87_ox:
	SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH + H2O2 > SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH*H2O2

R88_ox:
	SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH*H2O2

R89_ox:
	SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH + H2O2 > SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_sulfe_SOH_dec*SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH*H2O2

R90_ox:
	SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH + H2O2 > SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_sulfe_SOH_dec*SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH*H2O2

# Disulfide bridge formation - decamer

R91_disulf_form:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH > SH_SH__SH_SH__SH_SH__SH_SH__SH_SS
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH

R92_disulf_form:
	SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH > SH_SH__SH_SH__SH_SH__SH_SH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH

R93_disulf_form:
	SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH > SH_SH__SH_SH__SH_SH__SH_SOH__SH_SS
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH

R94_disulf_form:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH

R95_disulf_form:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH

R96_disulf_form:
	SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH

R97_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH > SH_SH__SH_SH__SH_SOH__SH_SH__SH_SS
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH

R98_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SH__SH_SS__SH_SH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH

R99_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH

R100_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH > SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SS
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH

R101_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH > SH_SOH__SH_SH__SH_SH__SH_SOH__SH_SS
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH

R102_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SS__SH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R103_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SOH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R104_disulf_form:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R105_disulf_form:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SS__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH

R106_disulf_form:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH

R107_disulf_form:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH

R108_disulf_form:
	SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH

R109_disulf_form:
	SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH

R110_disulf_form:
	SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SH__SOH_SOH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH

R111_disulf_form:
	SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH

R112_disulf_form:
	SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH > SOH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH

R113_disulf_form:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH > SH_SH__SH_SOH__SH_SOH__SH_SH__SH_SS
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH

R114_disulf_form:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH > SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SS
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH

R115_disulf_form:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SS__SH_SH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH

R116_disulf_form:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH

R117_disulf_form:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH

R118_disulf_form:
	SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH > SH_SH__SH_SS__SH_SH__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH

R119_disulf_form:
	SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH

R120_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SOH__SH_SS__SH_SH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH

R121_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH

R122_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH > SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SS
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH

R123_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH > SH_SOH__SH_SH__SH_SOH__SH_SOH__SH_SS
	2*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH

R124_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SS__SH_SH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R125_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SS__SH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R126_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SOH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R127_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R128_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R129_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R130_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R131_disulf_form:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R132_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SS__SOH_SOH__SH_SH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH

R133_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH > SH_SOH__SH_SH__SOH_SOH__SH_SH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH

R134_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH > SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH

R135_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R136_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SOH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R137_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R138_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R139_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R140_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R141_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SOH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R142_disulf_form:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R143_disulf_form:
	SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH > SH_SH__SOH_SOH__SOH_SOH__SH_SH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH

R144_disulf_form:
	SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH > SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH

R145_disulf_form:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R146_disulf_form:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R147_disulf_form:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R148_disulf_form:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R149_disulf_form:
	SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R150_disulf_form:
	SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SOH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R151_disulf_form:
	SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SH__SH_SS__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH

R152_disulf_form:
	SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH

R153_disulf_form:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R154_disulf_form:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SS__SH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R155_disulf_form:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SOH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R156_disulf_form:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH

R157_disulf_form:
	SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SS__SOH_SOH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH

R158_disulf_form:
	SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH

R159_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SOH > SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SS
	5*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SOH

R160_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SOH__SH_SS__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R161_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SS__SH_SOH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R162_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH

R163_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R164_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R165_disulf_form:
	SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R166_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH > SH_SOH__SH_SS__SOH_SOH__SH_SH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH

R167_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH > SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH

R168_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R169_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R170_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH > SH_SOH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH

R171_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R172_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R173_disulf_form:
	SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SOH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R174_disulf_form:
	SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH
	2*k_Prx_disulf_form_SH_dec*SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R175_disulf_form:
	SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS
	2*k_Prx_disulf_form_SOH_dec*SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R176_disulf_form:
	SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH

R177_disulf_form:
	SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SS__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH
	1*k_Prx_disulf_form_SH_dec*SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R178_disulf_form:
	SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R179_disulf_form:
	SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS
	4*k_Prx_disulf_form_SOH_dec*SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R180_disulf_form:
	SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS
	10*k_Prx_disulf_form_SOH_dec*SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

# Dissociation - decamer

R181_disso:
	SH_SH__SH_SH__SH_SH__SH_SH__SH_SS > {4}SH_SH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SH_SS

R182_disso:
	SH_SH__SH_SH__SH_SH__SH_SH__SOH_SS > {4}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SH__SOH_SS

R183_disso:
	SH_SH__SH_SH__SH_SH__SH_SOH__SH_SS > {3}SH_SH + {1}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SH_SS

R184_disso:
	SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SS > {3}SH_SH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SS

R185_disso:
	SH_SH__SH_SH__SH_SH__SH_SS__SOH_SOH > {3}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SH__SH_SS__SOH_SOH

R186_disso:
	SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SS > {3}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SS

R187_disso:
	SH_SH__SH_SH__SH_SOH__SH_SH__SH_SS > {3}SH_SH + {1}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SH_SS

R188_disso:
	SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SS > {3}SH_SH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SS

R189_disso:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SS > {2}SH_SH + {2}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SS

R190_disso:
	SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SS > {2}SH_SH + {2}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SS

R191_disso:
	SH_SH__SH_SH__SH_SOH__SH_SS__SOH_SOH > {2}SH_SH + {1}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SOH__SH_SS__SOH_SOH

R192_disso:
	SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SS > {2}SH_SH + {1}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SS

R193_disso:
	SH_SH__SH_SH__SH_SS__SH_SH__SOH_SOH > {3}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SS__SH_SH__SOH_SOH

R194_disso:
	SH_SH__SH_SH__SH_SS__SH_SOH__SOH_SOH > {2}SH_SH + {1}SH_SS + {1}SH_SOH + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SS__SH_SOH__SOH_SOH

R195_disso:
	SH_SH__SH_SH__SH_SS__SOH_SOH__SOH_SOH > {2}SH_SH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SH_SS__SOH_SOH__SOH_SOH

R196_disso:
	SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SS > {3}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SS

R197_disso:
	SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SS > {2}SH_SH + {1}SOH_SOH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SS

R198_disso:
	SH_SH__SH_SH__SOH_SOH__SH_SS__SOH_SOH > {2}SH_SH + {2}SOH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SH__SOH_SOH__SH_SS__SOH_SOH

R199_disso:
	SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS > {2}SH_SH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS

R200_disso:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SS > {2}SH_SH + {2}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SS

R201_disso:
	SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SS > {2}SH_SH + {2}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SS

R202_disso:
	SH_SH__SH_SOH__SH_SH__SH_SS__SOH_SOH > {2}SH_SH + {1}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SH__SH_SS__SOH_SOH

R203_disso:
	SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SS > {2}SH_SH + {1}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SS

R204_disso:
	SH_SH__SH_SOH__SH_SOH__SH_SH__SH_SS > {2}SH_SH + {2}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SH__SH_SS

R205_disso:
	SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SS > {2}SH_SH + {2}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SS

R206_disso:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SS > {1}SH_SH + {3}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SS

R207_disso:
	SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SS > {1}SH_SH + {3}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SS

R208_disso:
	SH_SH__SH_SOH__SH_SOH__SH_SS__SOH_SOH > {1}SH_SH + {2}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SOH__SH_SS__SOH_SOH

R209_disso:
	SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS > {1}SH_SH + {2}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS

R210_disso:
	SH_SH__SH_SOH__SH_SS__SH_SH__SOH_SOH > {2}SH_SH + {1}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SS__SH_SH__SOH_SOH

R211_disso:
	SH_SH__SH_SOH__SH_SS__SH_SOH__SOH_SOH > {1}SH_SH + {2}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SS__SH_SOH__SOH_SOH

R212_disso:
	SH_SH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH > {1}SH_SH + {1}SH_SOH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH

R213_disso:
	SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SS > {2}SH_SH + {1}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SS

R214_disso:
	SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS > {1}SH_SH + {2}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS

R215_disso:
	SH_SH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH > {1}SH_SH + {1}SH_SOH + {2}SOH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH

R216_disso:
	SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS > {1}SH_SH + {1}SH_SOH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS

R217_disso:
	SH_SH__SH_SS__SH_SH__SOH_SOH__SOH_SOH > {2}SH_SH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SS__SH_SH__SOH_SOH__SOH_SOH

R218_disso:
	SH_SH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH > {1}SH_SH + {1}SH_SS + {1}SH_SOH + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH

R219_disso:
	SH_SH__SH_SS__SOH_SOH__SH_SH__SOH_SOH > {2}SH_SH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SS__SOH_SOH__SH_SH__SOH_SOH

R220_disso:
	SH_SH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH > {1}SH_SH + {1}SH_SS + {2}SOH_SOH + {1}SH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH

R221_disso:
	SH_SH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH > {1}SH_SH + {1}SH_SS + {3}SOH_SOH
	k_Prx_disso_SH_dec*SH_SH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH

R222_disso:
	SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS > {2}SH_SH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS

R223_disso:
	SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS > {1}SH_SH + {2}SOH_SOH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS

R224_disso:
	SH_SH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH > {1}SH_SH + {3}SOH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH

R225_disso:
	SH_SH__SOH_SOH__SOH_SOH__SH_SH__SOH_SS > {2}SH_SH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SOH_SOH__SOH_SOH__SH_SH__SOH_SS

R226_disso:
	SH_SH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS > {1}SH_SH + {2}SOH_SOH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS

R227_disso:
	SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS > {1}SH_SH + {3}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS

R228_disso:
	SH_SOH__SH_SH__SH_SH__SH_SOH__SH_SS > {2}SH_SOH + {2}SH_SH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SH__SH_SOH__SH_SS

R229_disso:
	SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SS > {2}SH_SOH + {2}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SS

R230_disso:
	SH_SOH__SH_SH__SH_SH__SH_SS__SOH_SOH > {1}SH_SOH + {2}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SH__SH_SS__SOH_SOH

R231_disso:
	SH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS > {1}SH_SOH + {2}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS

R232_disso:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SH_SS > {3}SH_SOH + {1}SH_SH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SH_SS

R233_disso:
	SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SS > {3}SH_SOH + {1}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SS

R234_disso:
	SH_SOH__SH_SH__SH_SOH__SH_SS__SOH_SOH > {2}SH_SOH + {1}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SOH__SH_SS__SOH_SOH

R235_disso:
	SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS > {2}SH_SOH + {1}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS

R236_disso:
	SH_SOH__SH_SH__SH_SS__SH_SH__SOH_SOH > {1}SH_SOH + {2}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SS__SH_SH__SOH_SOH

R237_disso:
	SH_SOH__SH_SH__SH_SS__SH_SOH__SOH_SOH > {2}SH_SOH + {1}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SS__SH_SOH__SOH_SOH

R238_disso:
	SH_SOH__SH_SH__SH_SS__SOH_SOH__SOH_SOH > {1}SH_SOH + {1}SH_SH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SH__SH_SS__SOH_SOH__SOH_SOH

R239_disso:
	SH_SOH__SH_SH__SOH_SOH__SH_SH__SOH_SS > {1}SH_SOH + {2}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SOH_SOH__SH_SH__SOH_SS

R240_disso:
	SH_SOH__SH_SH__SOH_SOH__SH_SOH__SOH_SS > {2}SH_SOH + {1}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SOH_SOH__SH_SOH__SOH_SS

R241_disso:
	SH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS > {1}SH_SOH + {1}SH_SH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS

R242_disso:
	SH_SOH__SH_SOH__SH_SH__SH_SS__SOH_SOH > {2}SH_SOH + {1}SH_SH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SH_SH__SH_SS__SOH_SOH

R243_disso:
	SH_SOH__SH_SOH__SH_SH__SOH_SOH__SOH_SS > {2}SH_SOH + {1}SH_SH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SOH__SH_SH__SOH_SOH__SOH_SS

R244_disso:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SS > {4}SH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SS

R245_disso:
	SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SS > {4}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SS

R246_disso:
	SH_SOH__SH_SOH__SH_SOH__SH_SS__SOH_SOH > {3}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SH_SOH__SH_SS__SOH_SOH

R247_disso:
	SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS > {3}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS

R248_disso:
	SH_SOH__SH_SOH__SH_SS__SH_SH__SOH_SOH > {2}SH_SOH + {1}SH_SS + {1}SH_SH + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SH_SS__SH_SH__SOH_SOH

R249_disso:
	SH_SOH__SH_SOH__SH_SS__SH_SOH__SOH_SOH > {3}SH_SOH + {1}SH_SS + {1}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SH_SS__SH_SOH__SOH_SOH

R250_disso:
	SH_SOH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH > {2}SH_SOH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH

R251_disso:
	SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SS > {2}SH_SOH + {1}SOH_SOH + {1}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SS

R252_disso:
	SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS > {3}SH_SOH + {1}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS

R253_disso:
	SH_SOH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH > {2}SH_SOH + {2}SOH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SOH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH

R254_disso:
	SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS > {2}SH_SOH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS

R255_disso:
	SH_SOH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH > {2}SH_SOH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH

R256_disso:
	SH_SOH__SH_SS__SOH_SOH__SH_SH__SOH_SOH > {1}SH_SOH + {1}SH_SS + {2}SOH_SOH + {1}SH_SH
	k_Prx_disso_SH_dec*SH_SOH__SH_SS__SOH_SOH__SH_SH__SOH_SOH

R257_disso:
	SH_SOH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH > {2}SH_SOH + {1}SH_SS + {2}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH

R258_disso:
	SH_SOH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH > {1}SH_SOH + {1}SH_SS + {3}SOH_SOH
	k_Prx_disso_SH_dec*SH_SOH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH

R259_disso:
	SH_SOH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS > {1}SH_SOH + {2}SOH_SOH + {1}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS

R260_disso:
	SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS > {2}SH_SOH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS

R261_disso:
	SH_SOH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH > {1}SH_SOH + {3}SOH_SOH + {1}SH_SS
	k_Prx_disso_SH_dec*SH_SOH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH

R262_disso:
	SH_SOH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS > {2}SH_SOH + {2}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS

R263_disso:
	SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS > {1}SH_SOH + {3}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS

R264_disso:
	SH_SS__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH > {1}SH_SS + {4}SOH_SOH
	k_Prx_disso_SH_dec*SH_SS__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH

R265_disso:
	SOH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS > {2}SOH_SOH + {2}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SOH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS

R266_disso:
	SOH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS > {2}SOH_SOH + {1}SH_SH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SOH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS

R267_disso:
	SOH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS > {3}SOH_SOH + {1}SH_SH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SOH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS

R268_disso:
	SOH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS > {2}SOH_SOH + {2}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SOH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS

R269_disso:
	SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS > {3}SOH_SOH + {1}SH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS

R270_disso:
	SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS > {4}SOH_SOH + {1}SOH_SS
	k_Prx_disso_SOH_dec*SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS

### Parameters
## Dimer parameters
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
# !F f_Prx2_Inhib = (2.0*iSH_iSH+iSH_SH+iSH_SO2H+iSH_SOH+iSH_SS)/t_PSH

# 6
#!F fv_Prx2 = v_Prx2/v_H2O2_consumption
!F v_Prx2 = (Prx_R_R_ox()+Prx_O_S_oox()+Prx_R_O2_ox()+Prx_O_O2_oox()+Prx_R_O_ox()+Prx_R_O_oox()+Prx_R_S_ox()+Prx_O_O_oox())/Erythrocyte 
# Above originally /Compartment_1

# 7
#!F fv_Cat = v_Cat/v_H2O2_consumption
!F v_Cat = (Cat_1()+Cat_2())/Erythrocyte 
# Above originally /Compartment_1

# 9
# !F v_NADPH = NADP_reduction()/Erythrocyte - Chris
!F v_NADPH = (Trx_red1() + Trx_red2())/Erythrocyte 
# This makes more sense than the original

# 10
!F NADPH_div_H2O2 = NADP_reduction()/(Cat_1()+Cat_2()+GPx1()+Prx_R_R_ox()+Prx_R_O_ox()+Prx_R_O_oox()+Prx_R_S_ox()+Prx_O_O_oox()+Prx_O_S_oox()+Prx_R_O2_ox()+Prx_O_O2_oox())

# 11
!F f_NADPH_TrxR = Trx_red1()/(Trx_red1()+GSR())

# 15
!F f_PSH = t_PSH/(2.0*t_dimers)
!F t_PSH = 2.0*SH_SH+SH_SO2H+SH_SOH+SH_SS

# 16
!F f_PSOH = t_PSOH/(2.0*t_dimers)
!F t_PSOH = 2.0*SOH_SOH+SH_SOH+SOH_SO2H+SOH_SS

# 17
!F f_PSO2H = t_PSO2H/(2.0*t_dimers)
!F t_PSO2H = 2.0*SO2H_SO2H+SH_SO2H+SOH_SO2H+SS_SO2H

# 18
!F f_PSS = t_PSS/(2.0*t_dimers)
!F t_PSS = 2.0*SS_SS+SH_SS+SOH_SS+SS_SO2H

# 19
!F f_1SS = t_1SS/t_dimers
!F t_1SS = SH_SS+SOH_SS+SS_SO2H

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
# Above originally /Compartment_1
!F t_dimers = SH_SH+SH_SO2H+SO2H_SO2H+SOH_SO2H+SS_SO2H+SH_SOH+SOH_SOH+SH_SS+SOH_SS+SS_SS
!F t_Trx = Trx1SH_Trx2SH+Trx1SH_Trx2SOH+Trx1SOH_Trx2SH+Trx1SOH_Trx2SOH

# Assignment rules
# None of these rules are found in any reactions
# Some may be useful, but other are probably mostly junk

!F v_H2O2_prod = H2O2_production()/Erythrocyte 
# above originally "../Compartment_1"
!F f_NADPH = NADPHfree/(NADPfree+NADPHfree )
!F f_TrxR_star = f_TrxRR+f_TrxRO
!F r_NADPH = NADPHfree/NADPfree
!F r_NADPH_all = (NADPHfree+NADPHbound)/(NADPfree+NADPbound)
!F f_GSH = GSH/(2.0*GSSG+GSH)
# !F r_GS = GSH*GSH/GSSG
# !F r_Trx = (Trx1SH_Trx2SH+Trx1SH_Trx2SOH)/(Trx1SOH_Trx2SH+Trx1SOH_Trx2SOH)

## Decamer parameters

k_Prx_asso = 0 # add parameter
k_Prx_dec_disasso = 0 # add parameter
exponent = 0 # add parameter
k_Prx_sulfe_SH_dec = 0 # add parameter
k_Prx_sulfe_SOH_dec = 0 # add parameter
k_Prx_disulf_form_SH_dec = 0 # add parameter
k_Prx_disulf_form_SOH_dec = 0 # add parameter
k_Prx_disso_SH_dec = 0 # add parameter
k_Prx_disso_SOH_dec = 0 # add parameter

### Species
## Dimer Species
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
SH_SH@Erythrocyte = 285.0 
SH_SOH@Erythrocyte = 0.0 
SO2H_SO2H@Erythrocyte = 0.0 
SS_SO2H@Erythrocyte = 0.0 
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
eH2O2@Plasma = 0 
extH2O2@Plasma = 0 

# Parameters

# Reaction 1
H2O2_production_v = 0.0895 

# Reaction 4
GPx1_f1 = 0.0399 
GPx1_f2 = 9.72 

# Reaction 5
GSR_KMGSSG = 65.0 
GSR_KMNADPH = 8.5 
GSR_VMax = 49.0 

# Reaction 6
Cat_1_k1 = 6.0 

# Reaction 7
Cat_2_k1 = 18.0 

# Reaction 8
Cat_3_k1 = 0.011 

# Reaction 9
Cat_4_k1 = 73900.0 

# Reaction 10*, 12, 14, 25, 34
# called kox in paper
kprx = 100.0 
two_times_kprx = 200.0 
init_for_kprx = 100.0 

# Reaction 11, 17, 19, 27, 35
kcond = 1.7 
two_times_kcond = 3.4 
init_for_kcond = 1.7 

# Reaction 13, 18*, 20, 28, 36
ksulf = 0.012 
two_times_ksulf = 0.024 
init_for_ksulf = 0.012 

# Reaction 15, 16, 21, 22, 23*, 24*, 30, 31, 38, 39
kred = 0.21 
two_times_kred = 0.42 

# Reaction 26, 29, 32, 33*, 37
ksrx = 0.0001 
two_times_ksrx = 0.0002 

ktrx = 0.21 
two_times_ktrx = 0.42 

H2O2_perm = 10.9 

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
Erythrocyte = 7.17e-14 
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



v_GPx1 = 0.0 
ktrx_div_Ktrx1 = 0.0042 
two_times_ktrx_div_Ktrx1 = 0.0084 
KMTrx1SOH_Trx2SOH = 1830.0 
k_NADPsequest = 18000000.0 
k_NADPHsequest = 96000000.0 
kPrx2Inactiv = 1669000000.0 
f_PSO2H = 0.0 
v_H2O2_prod = 0.0 
v_H2O2_consumption = 0.0 
v_Cat = 0.0 
f_NADPH = 0.963168867269 
v_Prx2 = 0.0 
f_PSS = 0.0 
f_1SS = 0.0 
t_dimers = 285.0 
t_1SS = 0.0 
t_2SS = 0.0 
f_PSOH = 0.0 
init_for_two_times_ktrx = 0.42 
t_PSO2H = 0.0 
f_PSH = 1.0 
f_TrxOO = 0.0 
f_TrxOR = 0.0 
v_NADPH = 0.0 
f_TrxR_star = 1.0 
t_Trx = 0.56 
f_2SS = 0.0 
f_TrxRO = 0.0 
f_TrxRR = 1.0 
fv_Cat = 0.0 
f_NADPH_TrxR = 0.0 
NADPH_div_H2O2 = 0.0 
r_NADPH_free = 26.1509433962 
r_NADPH_all = 99.0 
#r_GS = inf 
f_GSH = 1.0 
#r_Trx = inf 
f_Prx2_Inhib = 1.0 
t_PSS = 0.0 
vPrx2_div_vCat = 0.0 
fv_Prx2 = 0.0 
t_PSH = 570.0 
t_PSOH = 0.0 

## Decamer Species

SH_SH__SH_SH__SH_SH__SH_SH__SH_SH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SH__SH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SOH__SH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SH__SH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SH_SS__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SS__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SH_SS__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SS__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SS__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SH_SS__SH_SH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SS__SOH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SOH_SOH__SOH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SOH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SS__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SS__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SH_SS__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SH__SOH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SOH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SH_SOH__SH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SS__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SS__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SH_SS__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SH_SH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SH_SS__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SH_SS__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SS__SOH_SOH__SH_SH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SS__SOH_SOH__SH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SH_SS__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SOH_SOH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SOH_SOH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SOH_SOH__SH_SS__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SOH_SOH__SOH_SOH__SH_SOH__SOH_SS@Erythrocyte = 0 
SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SH_SS__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SOH_SOH__SH_SH__SH_SH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SOH_SOH__SH_SH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SOH_SOH__SH_SH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SOH_SOH__SH_SOH__SH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SOH_SOH__SH_SOH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH@Erythrocyte = 0 
SOH_SOH__SOH_SOH__SOH_SOH__SOH_SOH__SOH_SS@Erythrocyte = 0 
### References

### End
