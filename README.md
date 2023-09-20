# Modelling the decamerisation cycle of PRDX1 and the inhibition-like effect on its peroxidase activity

### Christopher J. Barry, Ché S. Pillay, Johann M. Rohwer

_Antioxidants_ __2023__, _12_(9), 1707; https://doi.org/10.3390/antiox12091707

# Supplementary Code and Data

This repository contains supplementary code, data and model descriptions to
reproduce the simulations in the manuscript.

You can run the Jupyter notebooks *online*, or set up a *local computational environment* to 
run the simulations on your own laptop or desktop computer.

## Running the Jupyter Notebooks online with Binder

You can use Binder to run the Jupyter Notebooks online, by clicking on this badge:  
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Rohwer-Lab/Barry2023.git/HEAD)  
(**NOTE:** you will be directed to Binder, this will not open a new tab! You can use right-click -> `Open in new Tab`.
When the Binder environment is created for the first time, it may take a while.)
  
- This will start a JupyterLab session in your browser.
- On the left you find the folder structure. Double-click on the folder you want to open, e.g. `fit_PRDX1_koff_kon`. 
- The Jupyter Notebooks have a small orange image icon. Double-click on the notebook you want to run.
- Now you can interact with the notebook. To run all cells click the icon with the two arrows, left of `Download`, 
  and click on Restart in the popup.
- Each cell will automatically run from top to bottom. When a code cell was run a number appears in the brackets on the left.


## Set-up of local computational environment

Reproducing the simulations requires a working Python 3 (>=3.8) environment 
with the Jupyter Notebook and a selection of libraries for scientific computation.
It is best set up in a **separate virtual environment** using the requirement
specifications provided, either for Anaconda, or using `pip` in a normal Python environment.

### Step 1: Clone this GitHub repository

```bash
git clone https://github.com/Rohwer-Lab/Barry2023.git
```

### Step 2a: Install Anaconda Python distribution

By far the easiest way to set up the environment is using
[Anaconda](https://www.anaconda.com/download). Dependencies are installed automatically.
```bash
conda env create -f environment.yml
conda activate barry-prx
jupyter-notebook
```

### <u>OR</u> Step 2b: Install requirements using Python and `pip`

The simulations require the use of the `CVODE` solver, which is provided by the `Assimulo` Python package. 
Unfortunately the Assimulo version on PyPI is *severely outdated*, so the package cannot be installed 
with `pip`, but has to be compiled and built by hand 
(see [Assimulo install documentation](https://jmodelica.org/assimulo/installation.html)).

Once Assimulo is built and installed, the other requirements can be installed with:
```bash
pip install -r requirements.txt
jupyter-notebook
```

Note, however, that installation with `conda` (see above) is by far the easier option. See also 
[PySCeS installation instructions](https://pyscesdocs.readthedocs.io/en/latest/userguide_doc.html#installing-and-configuring).

## Reproducing the simulations in the paper

To reproduce the simulations, execute the Jupyter notebooks in the following 
folders in sequence. The notebooks are annotated and documented to explain
what is being done.
1. `Prx_dim-dec_equi`
    - **Requires:** Prx dimer-decamer equilibrium model (`Prx_dim-dec.psc`).
    - **Analysis:** Prx equilibrium simulations.
    - **Plot:**  Figure 2


2. `ITC_data`
    - **Requires:** digitized ITC data from Barranco-Medina 2008 (`ITC_data_PRDX1.csv`).
    - **Analysis:** demonstrates ITC experimental data processing pipeline.
    - **Writes:** processed ITC data (`ITC_data_PRDX1_processed.csv`).
    - **Plot:** Figure S1


3. `ITC_model`
    - **Requires:** ITC Prx dimer-decamer equilibrium model (`ITC_Prx_dim-dec.psc`)
    - **Writes:** _Arabidopsis thaliana_ Prx ITC injection parameters from Barranco-Medina 2008 Fig. 1a (`ITC_At_inject_params.csv`).
    - **Analysis:** demonstrates ITC simulation data processing pipeline.
    - **Plot:** Figure 3


4. `fit_PRDX1_koff_kon`
    - **Requires** ITC Prx dimer-decamer equilibrium model and processed ITC data.
    - **Analysis:** fit the PRDX1 dimer-decamer _k_<sub>off</sub> (and _k_<sub>on</sub>) to the processed digitized ITC data.
    - **Writes:** PRDX1 ITC injection parameters from Barranco-Medina 2008 Fig. 1c (`ITC_PRDX1_inject_params.csv`).
    - **Writes:** PRDX1 dimer-decamer fitted parameters (`fitted_koff_kon_PRDX1_params.csv`).
    - **Plot:** Figure 4


5. `RBC_PRDX2_sims`
    - **Requires:** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** RBC PRDX2 Model A (`RBC_PRDX2_modelA.psc`), RBC PRDX2 Model B (`RBC_PRDX2_modelB.psc`) and RBC PRDX2 Model A with decamerisation (`RBC_PRDX2_modelA_decfull.psc`) as well as the PRDX1 dimer-decamer fitted parameters.
    - **Analysis:** replicates the analyses of Benfeitas 2014 comparing the three RBC PRDX2 models.
    - **Plot:** Figures 6, S3-S6, S9a and S9b


6. `dilution_assay`
    - **Requires:** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** Prx dimer-decamer dilution model (`Prx_dim-dec_dil.psc`).
    - **Analysis:** simulations of the time to equilibrium after diluting a Prx solution.
    - **Plot:** Figures 8a, 8b, and S7


7. `HRP_assay`
    - **Requires:** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** HRP PRDX2 model (`HRP_PRDX2.psc`), HRP PRDX2 with decamerisation model (`HRP_PRDX2_decfull.psc`) and the HRP PRDX2 with decamerisation and 5 disulphide-bridges model (`HRP_PRDX2_decfull_5dsb.psc`).
    - **Analysis:** simulations of HRP competition assays with PRDX2.
    - **Plot:** Figures 7a, 7b, 8c, 8d, S8a, S8b, S9c and S9d


8. `NADPH_assay`
    - **Requires** PRDX1 dimer-decamer fitted parameters.
    - **Requires:** PRDX2 cycle model (`PRDX2_sys.psc`), PRDX2 cycle with decamerisation model (`PRDX2_sys_decfull.psc`) and the PRDX2 cycle with decamerisation and 5 disulphide-bridges model (`PRDX2_sys_decfull_5dsb.psc`).
    - **Analysis:** simulations of  NADPH reduction assays in a system containing Prx, Trx, TRR, and H<sub>2</sub>O<sub>2</sub>.
    - **Plot:** Figure 7c, 7d, S8c, S8d, S9e and S9f

## Writing the models in the paper

The models that form part of the manuscript are provided as input files for PySCeS (`*.psc`) and in the standard 
SBML format (`*.xml`) in the `models` folder. However, since 
the algorithm to enumerate the peroxidase reactions of peroxiredoxin forms part of the main text,
the scripts to enumerate these reactions are provided here together with scripts to generate PySCeS input files 
for all models in the paper.

To produce the models, execute the Jupyter notebooks in the following 
folders in sequence. The notebooks are annotated and documented to explain
what is being done. 

1. `algorithm_Prx_decfull_rxns`
    - **Analysis:** Enumerates the peroxidase reactions of Prx decamers using the algorithm described in the manuscript.
    - **Writes:** Prx decamer peroxidase reactions _without_ hyperoxidation (`Prx decamer reactions - no hyperoxidation.txt`).
    - **Writes:** Prx decamer peroxidase reactions with 5 disulphide-bridges and _without_ hyperoxidation (`Prx decamer reactions - no hyperoxidation 5dsb.txt`).
    - 
2. `write_models`
    - **Requires:** Prx decamer peroxidase reactions _without_ hyperoxidation.
    - **Requires:** RBC PRDX2 Model A (`RBC_PRDX2_modelA.psc`).
    - **Writes:** Prx dimer-decamer equilibrium model (`Prx_dim-dec.psc`).
    - **Writes:** ITC Prx dimer-decamer equilibrium model (`ITC_Prx_dim-dec.psc`).
    - **Writes:** RBC PRDX2 Model A with decamerisation (`RBC_PRDX2_modelA_decfull.psc`).
    - **Writes:** Prx dimer-decamer dilution model (`Prx_dim-dec_dil.psc`).
    - **Writes:** HRP PRDX2 model (`HRP_PRDX2.psc`), HRP PRDX2 with decamerisation model (`HRP_PRDX2_decfull.psc`) and the HRP PRDX2 with decamerisation and 5 disulphide-bridges model (`HRP_PRDX2_decfull_5dsb.psc`).
    - **Writes:** PRDX2 cycle model (`PRDX2_sys.psc`), PRDX2 cycle with decamerisation model (`PRDX2_sys_decfull.psc`) and the PRDX2 cycle with decamerisation and 5 disulphide-bridges model (`PRDX2_sys_decfull_5dsb.psc`).

