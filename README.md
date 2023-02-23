# Computational Workflow and Analysis Code for Anchor Project

Code for computational workflows and analyses relating to "Computational prediction of MHC anchor locations guide neoantigen identification and prioritization"

## Table of Contents

Computational Prediction of Anchor locations
- Combining all input data
- Selecting HLA alleles and their corresponding strong binding peptides
- Saturation analysis using HLA-A*02:01
- Generating FASTA files for input into pVACbind
- Running pVACbind in parallel
- Collecting pVACbind results and calculating anchor probabilities

Orthogonal validation with crystallography structures
- Mdtraj package to calculate distance and SASA
- Comparison with our own prediction data

Evaluating Anchor Impact
- Selection of a balanced HLA population from remaining TCGA samples
- Generating FASTA files and running pVACbind
- Predetermining anchor locations
- Analyzing the entire cohort using three different criteria

Validation peptide selection and analysis
- Anchor calculation performed for all good binding candidates 
- Selecting peptides following expected anchor pattern
- Deciding mutations and positions
- Plotting

Analysis requested by Reviewers
- Evaluating seed peptide source
- Generating random peptide sequences from 3 different sources
- Running pVACbind
- Calculating anchor probabilities
- Bias analysis for HLA allele specific anchor patterns
- Collected training data/ distance of neighbors


## Resources 
1. For researchers wanting to incoprorate our end results into their pipelines:
    - Normalized anchor scores are available in supplemental materials of original paper and also available under [Datasets](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Datasets) in this github repository.
    - Our complied seed dataset (containing peptide sequences, hla allele and all 8 binding algorithm outputs) are also available under [Datasets](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Datasets).
2. For researchers looking to expand this database for particular HLA alleles, we recommend the following steps:
    - Identify strong binding peptides for the HLA allele(s) and peptide length(s) you are querying about.
    - Generate a dictionary of peptides where each position is mutated to all possible amino acids.
    - Use that dictionary to generate a FASTA file in the format required by pVACbind (www.pvactools.org).
    - Run pvacbind in parallel across different HLA allele(s) and peptide length(s).
        - Note that you will likely have to run each combination in a separate command (we provide the scripts we used on our own cluster for your adaptation).
    - Assemble prediction results and calculate the anchor scores for each position of each peptide (please refer to helper functions in [Anchor Position Calculation.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Anchor%20Position%20Calculation.ipynb)).
    - This process can be done on a individual peptide-HLA combination basis but also you can aggregate and average across multiple peptides (for the same length for the same HLA allele )for an overall score.