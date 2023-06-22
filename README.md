# Modelling the decamerisation cycle of PRDX1 and the inhibition-like effect on its peroxidase activity

### Christopher J. Barry, Ché S. Pillay, Johann M. Rohwer

Submitted to _Antioxidants_

This repository contains supplementary code, data and model descriptions to
reproduce the simulations in the manuscript.

## Set-up of computational environment

Reproducing the simulations requires a working Python 3 (>=3.8) environment 
with the Jupyter Notebook and a selection of libraries for scientific computation.
It is best set up in a separate virtual environment using the requirement
specifications provided, either for Anaconda, or using `pip` in a normal Python environment.

### Anaconda Python distribution

By far the easiest way to set up the environment is using
[Anaconda](https://www.anaconda.com/download). Dependencies are installed automatically.
```bash
conda env create -f environment.yml
conda activate barry-prx
pip install identifiability
```

### Using Python and `pip`

The simulations require the use of the `CVODE` solver, which is provided by the `Assimulo` Python package. 
Unfortunately the Assimulo version on PyPI is *severely outdated*, so the package cannot be installed 
with `pip`, but has to be compiled and built by hand 
(see [Assimulo install documentation](https://jmodelica.org/assimulo/installation.html)).

Once Assimulo is built and installed, the other requirements can be installed with:
```bash
pip install -r requirements.txt
```

Note, however, that installation with `conda` (see above) is by far the easier option. See also 
[PySCeS installation instructions](https://pyscesdocs.readthedocs.io/en/latest/userguide_doc.html#installing-and-configuring).

## Reproducing the simulations in the paper

To reproduce the simulations, execute the Jupyter notebooks in the following 
folders in sequence. The notebooks are annotated and documented to explain
what is being done.
1. `Prx_dim-dec_equi`
    - **Requires:** Prx dimer-decamer equilibrium model (`Prx_dim-dec.psc`).
    - **Analysis:** Prx equilibrium simulations
    - **Plot:**  Figure 2


2. \*`fit_PRXD1_Kd`
    - **Requires:** Prx dimer-decamer equilibrium model
    - **Analysis:** fits the dimer-decamer equilibrium $K_d$ to Villar data.
    - **Writes:** fitted $K_d$ (`fitted_Kd_PRDX1_params.csv`).
    - \*Note: Not part of the main text.


3. `ITC_data`
    - **Requires:** digitized ITC data from Barranco-Medina 2008 (`ITC_data_PRDX1.csv`).
    - **Analysis:** demonstrates ITC experimental data processing pipeline.
    - **Writes:** processed ITC data (`ITC_data_PRDX1_processed.csv`).
    - **Plot:** Figure S1


4. `ITC_model`
    - **Requires:** ITC Prx dimer-decamer equilibrium model (`ITC_Prx_dim-dec.psc`)
    - **Writes:** _Arabidopsis thaliana_ Prx ITC injection parameters from Barranco-Medina 2008 Fig. 1a (`ITC_At_inject_params.csv`).
    - **Analysis:** demonstrates ITC simulation data processing pipeline.
    - **Plot:** Figure 3


5. `fit_PRDX1_koff_kon`
    - **Requires** ITC Prx dimer-decamer equilibrium model and processed ITC data.
    - **Analysis:** fit the PRDX1 dimer-decamer $k_{off}$ (and $k_{on}$) to the processed digitized ITC data.
        - **Writes:** PRDX1 ITC injection parameters from Barranco-Medina 2008 Fig. 1c (`ITC_PRDX1_inject_params.csv`).
        - **Writes:** PRDX1 dimer-decamer fitted parameters (`fitted_koff_kon_PRDX1_params.csv`).
        - **Plot:** Figure 4
    - **\*Analysis:** fit the PRDX1 dimer-decamer association $K_{d}$ and$k_{off}$ (and $k_{on}$) to the processed digitized ITC data.
        - **Writes:** PRDX1 dimer-decamer $K_d$ and $k_{off}$ fit simultaneously (`fitted_Kd_koff_kon_PRDX1_params.csv`).
        - **Analysis:** Identifiability analysis on the $K_d$ and $k_{off}$ fit simultaneously.
        - \*Note: Not part of the main text


6. `RBC_PRDX2_sims`
    - **Requires:** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** RBC PRDX2 Model A (`RBC_PRDX2_modelA.psc`), RBC PRDX2 Model B (`RBC_PRDX2_modelB.psc`) and RBC PRDX2 Model A with decamerisation (`RBC_PRDX2_modelA_decfull.psc`) as well as the PRDX1 dimer-decamer fitted parameters.
    - **Analysis:** replicates the analyses of Benfeitas 2014 comparing the three RBC PRDX2 models.
    - **Plot:** Figure 6 and S3-6


7. `dilution_assay`
    - **Requires:** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** Prx dimer-decamer dilution model (`Prx_dim-dec_dil.psc`).
    - **Analysis:** simulations of the time to equilibrium after diluting a Prx solution.
    - **Plot:** Figure S7, 8a, and 8b


8. `HRP_assay`
    - **Requires:** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** HRP PRDX2 model (`HRP_PRDX2.psc`) and the HRP PRDX2 with decamerisation model (`HRP_PRDX2_decfull.psc`).
    - **Analysis:** simulations of HRP competition assays with PRDX2.
    - **Plot:** Figure 7a, 7b, 8c, and 8d


9. `NADPH_assay`
    - **Requires** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** PRDX2 cycle model (`PRDX2_sys.psc`) and the PRDX2 cycle with decamerisation model (`PRDX2_sys_decfull.psc`).
    - **Analysis:** simulations of  NADPH reduction assays in a system containing Prx, Trx, TRR, and $H_2O_2$.
    - **Plot:** Figure 7c and 7d

## Writing the models in the paper

The models which form part of the text are provided as input files for PySCeS and SBML; however, since 
the algorithm to enumerate the peroxidase reactions of peroxiredoxin forms part of the main text,
the scripts to enumerate these reactions are provided here together with scripts to generate PySCeS input files for all models in the paper.
To produce the models, execute the Jupyter notebooks in the following 
folders in sequence. The notebooks are annotated and documented to explain
what is being done. 

1. `algorithm_Prx_decfull_rxns`
    - **Analysis:** Enumerates the peroxidase reactions of Prx decamers using the algorithm described in the text.
    - **Writes:** Prx decamer peroxidase reactions _without_ hyperoxidation (`Prx decamer reactions - no hyperoxidation.txt`).
    - **Writes:** Prx decamer peroxidase reactions _with_ hyperoxidation (`Prx decamer reactions - with hyperoxidation.txt`).

2. `write_models`
    - **Requires:** Prx decamer peroxidase reactions _with_ hyperoxidation and Prx decamer peroxidase reactions _without_ hyperoxidation.
    - **Requires:** RBC PRDX2 Model A (`RBC_PRDX2_modelA.psc`).
    - **Writes:** Prx dimer-decamer equilibrium model (`Prx_dim-dec.psc`).
    - **Writes:** ITC Prx dimer-decamer equilibrium model (`ITC_Prx_dim-dec.psc`).
    - **Writes:** RBC PRDX2 Model A with decamerisation (`RBC_PRDX2_modelA_decfull.psc`).
    - **Writes:** Prx dimer-decamer dilution model (`Prx_dim-dec_dil.psc`).
    - **Writes:** HRP PRDX2 model (`HRP_PRDX2.psc`) and the HRP PRDX2 with decamerisation model (`HRP_PRDX2_decfull.psc`).
    - **Writes:** PRDX2 cycle model (`PRDX2_sys.psc`) and the PRDX2 cycle with decamerisation model (`PRDX2_sys_decfull.psc`).

