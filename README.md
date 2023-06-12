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

- first
- second
