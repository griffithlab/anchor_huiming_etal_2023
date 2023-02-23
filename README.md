# Computational Workflow and Analysis Code for Anchor Project

Code for computational workflows and analyses relating to "Computational prediction of MHC anchor locations guide neoantigen identification and prioritization"

## Table of Contents

### Computational Prediction of Anchor locations
- [Initial_peptide_database.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Computational_prediction_of_anchor_locations/Initial_peptide_database.ipynb)
    - Combining all input data and selecting HLA alleles and their corresponding strong binding peptides
- [Saturation_analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Computational_prediction_of_anchor_locations/Saturation_analysis.ipynb)
    - Saturation analysis using HLA-A*02:01
- [fasta_generator.py](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Computational_prediction_of_anchor_locations/fasta_generator.py)
    - Generating FASTA files for input into pVACbind
- [pvacbind_run.sh](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Shell%20Scripts/pvacbind_run.sh)
    - Running pVACbind in parallel
- [Anchor Position Calculation.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Computational_prediction_of_anchor_locations/Anchor%20Position%20Calculation.ipynb)
    - Collecting pVACbind results and calculating anchor probabilities
- [Anchor_cluster_analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Computational_prediction_of_anchor_locations/Anchor_cluster_analysis.ipynb)
    - Summarizing anchor trends using hierarchical clustering and heatmaps

### Orthogonal validation with crystallography structures
- [Validation_pMHC_crystallography_analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Validation_pMHC_crystallography_analysis.ipynb)
    - Mdtraj package to calculate distance and SASA
    - Comparison with our own prediction data
- [TCR validation data analysis.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/TCR%20validation%20data%20analysis.ipynb)
    - Repeat analysis with TCR-peptide-MHC pdb structures

### Evaluating Anchor Impact
- [Impact Analysis TCGA samples.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Orthogonal_validation_with_crystallography_structures/Impact%20Analysis%20TCGA%20samples.ipynb)
    - Selection of a balanced HLA population from remaining TCGA samples
    - Generating FASTA files and running pVACbind
    - Objective determination of anchor locations
    - Analyzing the entire cohort using three different filters (no anchor, conventional anchor and allele-specific anchor)
- [Impact analysis using different binding cutoffs.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Orthogonal_validation_with_crystallography_structures/Impact%20analysis%20using%20different%20binding%20cutoffs.ipynb)
    - Repeating analysis using different binding cutoffs and inclusion criteria

### Validation peptide selection and analysis
- [Generation of experimental validation candidates.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Experimental_validation/Generation%20of%20experimental%20validation%20candidates.ipynb)
    - Anchor calculation performed for all good binding candidates 
    - Selecting peptides for experimental validation
    - Deciding mutations and positions
- [Validation Plots.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Experimental_validation/Validation%20Plots.ipynb)
    - Evaluation of experimental results

### Additional analyses
- [Comparison between seed dataset and other random peptide sets.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Other_analyses/Comparison%20between%20seed%20dataset%20and%20other%20random%20peptide%20sets.ipynb)
    - Evaluating seed peptide source by generating random peptide sequences from 3 different sources and repeating analysis
- [Reviewer response analysis (HLA distribution).ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Other_analyses/Reviewer%20response%20analysis%20(HLA%20distribution).ipynb)
    - Bias analysis for HLA allele specific anchor patterns
- [Reviewer response - Scenario count.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Other_analyses/Reviewer%20response%20-%20Scenario%20count.ipynb)
    - Determining how many SNVs fell into each scenario


### Resources 
1. For researchers wanting to incoprorate our end results into their pipelines:
    - Normalized anchor scores are available in supplemental materials of original paper and also available under [Datasets](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Datasets) in this github repository.
    - Our complied seed dataset (containing peptide sequences, hla allele and all 8 binding algorithm outputs) are also available under [Datasets](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Datasets).
2. For researchers looking to expand this database for particular HLA alleles, we recommend the following steps:
    - Identify strong binding peptides for the HLA allele(s) and peptide length(s) you are querying about.
    - Generate a dictionary of peptides where each position is mutated to all possible amino acids.
    - Use that dictionary to generate a FASTA file in the format required by pVACbind (www.pvactools.org).
    - Run pvacbind in parallel across different HLA allele(s) and peptide length(s).
        - Note that you will likely have to run each combination in a separate command (we provide the [scripts](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Shell%20Scripts/) we used on our own cluster for your adaptation).
    - Assemble prediction results and calculate the anchor scores for each position of each peptide (please refer to helper functions in [Anchor Position Calculation.ipynb](https://github.com/griffithlab/anchor_huiming_etal_2023/blob/master/Python%20Scripts/Computational_prediction_of_anchor_locations/Anchor%20Position%20Calculation.ipynb)).
    - This process can be done on a individual peptide-HLA combination basis but also you can aggregate and average across multiple peptides (for the same length for the same HLA allele )for an overall score.

## License

The project is licensed under the [MIT license](https://opensource.org/licenses/MIT).

## Stable release with DOI

[![DOI](https://zenodo.org/badge/604686470.svg)](https://zenodo.org/badge/latestdoi/604686470)