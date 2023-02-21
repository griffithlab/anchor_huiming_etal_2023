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