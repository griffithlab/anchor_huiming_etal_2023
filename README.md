# Computational Workflow and Analysis Code for Anchor Project

Code for computational workflows and analyses relating to "Computational prediction of MHC anchor locations guide neoantigen identification and prioritization"

## Table of Contents

Computational Prediction of Anchor locations
- Combining all input data and selecting HLA alleles and their corresponding strong binding peptides
    - [Initial_peptide_database.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Initial_peptide_database.ipynb)
- Saturation analysis using HLA-A*02:01
    - [Saturation_analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Saturation_analysis.ipynb)
- Generating FASTA files for input into pVACbind
    - [fasta_generator.py](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/fasta_generator.py)
- Running pVACbind in parallel
    - [pvacbind_run.sh](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Shell Scripts/pvacbind_run.sh)
- Collecting pVACbind results and calculating anchor probabilities
    - [Anchor Position Calculation.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Anchor%20Position%20Calculation.ipynb)
- Summarizing anchor trends using hierarchical clustering and heatmaps
    - [Anchor_cluster_analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Anchor_cluster_analysis.ipynb)

Orthogonal validation with crystallography structures
- Mdtraj package to calculate distance and SASA
- Comparison with our own prediction data
- [Validation_pMHC_crystallography_analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Validation_pMHC_crystallography_analysis.ipynb)
- [TCR validation data analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/TCR%20validation%20data%20analysis.ipynb)

Evaluating Anchor Impact
- Selection of a balanced HLA population from remaining TCGA samples
- Generating FASTA files and running pVACbind
- Objective determination of anchor locations
- Analyzing the entire cohort using three different filters (no anchor, conventional anchor and allele-specific anchor)
- [Impact Analysis TCGA samples.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Impact%20Analysis%20TCGA%20samples.ipynb)
- Repeating analysis using different binding cutoffs and inclusion criteria
- [Impact analysis using different binding cutoffs.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Impact%20analysis%20using%20different%20binding%20cutoffs.ipynb)

Validation peptide selection and analysis
- Anchor calculation performed for all good binding candidates 
- Selecting peptides for experimental validation
- Deciding mutations and positions
    - [Generation of experimental validation candidates.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Generation%20of%20experimental%20validation%20candidates.ipynb)
- Evaluation of experimental results
    - [Validation Plots.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Validation%20Plots.ipynb)

Analysis requested by Reviewers
- Evaluating seed peptide source by generating random peptide sequences from 3 different sources and repeating analysis
    - [Comparison between seed dataset and other random peptide sets.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Comparison%20between%20seed%20dataset%20and%20other%20random%20peptide%20sets.ipynb)
- Bias analysis for HLA allele specific anchor patterns
    - [Reviewer response analysis (HLA distribution).ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Reviewer%20response%20analysis%20(HLA%20distribution).ipynb)
- Determining how many SNVs fell into each scenario
    - [Reviewer response - Scenario count.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Reviewer%20response%20-%20Scenario%20count.ipynb)


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