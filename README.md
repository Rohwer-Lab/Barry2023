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

\begin{enumerate}
\item \textsf{Prx\_dim-dec\_equi}
\begin{description}
\item[Write:] Prx dimer-decamer equilibrium model
(\textsf{Prx\_dim-dec.psc}).
\item[Analysis:] Prx equilibrium simulations
\item[Plot:] \textbf{Figure 2}
\end{description}

\item \textsf{fit\_PRXD1\_Kd}
\begin{description}
\item[Requires:] Prx dimer-decamer equilibrium model
\item[Analysis:] fits the dimer-decamer equilibrium $K_d$ to Villar data.
\item[Write:] fitted $K_d$
(\textsf{fitted\_Kd\_PRDX1\_params.csv}).
\end{description}
*Note: Not part of the main text.

\item \textsf{ITC\_data}
\begin{description}
\item[Requires:] digitized ITC data
(\textsf{ITC\_data\_At.csv} and \textsf{ITC\_data\_PRDX1.csv}).
\item[Analysis:] demonstrates ITC experimental data processing pipeline.
\item[Write:] processed ITC data
(\textsf{ITC\_data\_At\_processed.csv} and
\textsf{ITC\_data\_PRDX1\_processed.csv}).
\item[Plot:]\textbf{Figure S1}
\end{description}

\item \textsf{ITC\_model}
\begin{description}
\item[Write:] ITC Prx dimer-decamer equilibrium model
(\textsf{ITC\_Prx\_dim-dec.psc}).
\item[Write:] Barranco-Medina 2008 Fig.~1a \textit{Arabidopsis thaliana}
injection parameters
(\textsf{ITC\_At\_inject\_params.csv}).
\item[Analysis:] demonstrates ITC simulation data processing pipeline.
\item[Plot:]\textbf{Figure 3}
\end{description}

\item \textsf{fit\_PRDX1\_koff\_kon}
\begin{description}
\item[Requires:] ITC Prx dimer-decamer equilibrium model and processed ITC
data.
\item[Analysis:] fit the PRDX1 dimer-decamer association and disassociation
rate constants to the processed digitized ITC data.
\item[Write:] Barranco-Medina 2008 Fig.~1c PRDX1 injection parameters
(\textsf{ITC\_PRDX1\_inject\_params.csv}).
\item[Write:] PRDX1 dimer-decamer fitted parameters
(\textsf{fitted\_koff\_kon\_PRDX1\_params.csv}).
\item[*Write:] PRDX1 dimer-decamer $K_d$ and $k_{off}$ fit simultaneously
(\textsf{fitted\_Kd\_koff\_kon\_PRDX1\_params.csv}).
\item[*Analysis:] Identifiability analysis on the $K_d$ and $k_{off}$ fit
simultaneously.
\item[Plot:]\textbf{Figure 4}
\end{description}
*Not part of the main text

\item \textsf{algorithm\_Prx\_decfull\_rxns}
\begin{description}
\item[Analysis:] Enumerates the peroxidase reactions of Prx decamers using the
algorithm described in the text.
\item[Write:] Prx decamer peroxidase reactions \emph{without} hyperoxidation
(\textsf{Prx decamer reactions - no hyperoxidation.txt}).
\item[Write:] Prx decamer peroxidase reactions \emph{with} hyperoxidation
(\textsf{Prx decamer reactions - with hyperoxidation.txt}).
\end{description}

\item \textsf{add\_rxns\_to\_RBC\_PRDX2\_models}
\begin{description}
\item[Requires:] Prx decamer peroxidase reactions \emph{without}
hyperoxidation, Prx decamer peroxidase reactions \emph{with} hyperoxidation
and RBC PRDX2 Model~A (\textsf{RBC\_PRDX2\_modelA.psc}).
\item[Write:] RBC PRDX2 Model A with decamerisation \emph{without}
decamer hyperoxidation (\textsf{RBC\_PRDX2\_modelA\_decfull.psc}).
\item[Write:] RBC PRDX2 Model A with decamerisation \emph{with} decamer
hyperoxidation (\textsf{RBC\_PRDX2\_modelA\_decfull\_hyp.psc}).
\item Note: RBC PRDX2 Model~A with decamerisation and hyperoxidation was not
carried forward in the analyses, as mentioned in the main text.
\end{description}

\item \textsf{RBC\_PRDX2\_sims}
%Prx RBC model sims.ipynb
\begin{description}
\item[Requires:] RBC PRDX2 Model~A, RBC PRDX2 Model~B
(\textsf{RBC\_PRDX2\_modelB.psc})
 and RBC PRDX2 Model~A with decamerisation as well as the PRDX1 dimer-decamer
fitted parameters.
\item[Analysis:] replicates the analyses of Benfeitas~et~al.~2014 comparing the
three RBC PRDX2 models.
\item[Plot:]\textbf{Figure 6} and \textbf{Figure S4-7}
\end{description}

\item \textsf{dilution\_assay}
% Dilution time to equilibrium.ipynb
\begin{description}
\item[Requires:] PRDX1 dimer-decamer fitted parameters.
\item[Write:] Prx dimer-decamer dilution model
(\textsf{Prx\_dim-dec\_dil.psc}).
\item[Analysis:] simulations of the time to equilibrium after diluting a Prx
solution.
\item[Plot:]\textbf{Figure S3} and \textbf{Figure 8a} and \textbf{Figure
8b}
\end{description}

\item \textsf{HRP\_assay}
%HRP assay with decamerisation.ipynb
\begin{description}
\item[Requires:] PRDX1 dimer-decamer fitted parameters and the Prx decamer
peroxidase reactions \emph{without} hyperoxidation.
\item[Write:] HRP Prx model (\textsf{HRP\_PRDX2.psc}) and
the HRP Prx with decamerisation model
(\textsf{HRP\_PRDX2\_decfull.psc}).
\item[Analysis:] simulations of HRP competition assays with PRDX2.
\item[Plot:]\textbf{Figure 7a} and \textbf{b} and \textbf{Figure 8c} and
\textbf{d}
\end{description}

\item \textsf{NADPH\_assay}
%Whole system assay Prx cycle.ipynb
\begin{description}
\item[Requires:] PRDX1 dimer-decamer fitted parameters and the Prx decamer
peroxidase reactions \emph{without} hyperoxidation.
\item[Write:] PRDX2 cycle model (\textsf{PRDX2\_sys.psc})
and PRDX2 cycle with decamerisation model
(\textsf{PRDX2\_sys\_decfull.psc}).
\item[Analysis:] simulations of  NADPH reduction assays in a system containing
Prx, Trx, TRR, and H\textsubscript{2}O\textsubscript{2}.
\item[Plot:]\textbf{Figure 7c} and \textbf{d}
\end{description}

\end{enumerate}

