#!/bin/bash

#First loop through pvacbind lookup file generated from fasta_generator.py script which takes in location of dataset as an argument
#For each loop, submit the corresponding pvacbind job using docker container: susannakiwala/pvactools:1.5.0b until new release of pvactools 
#Use the proper output directory for each run

COUNT=1
while IFS='' read -r line || [[ -n "$line" ]]
do
    length="$(echo $line | cut -d$',' -f2)"
    hla_allele="$(echo $line | cut -d$',' -f1)"
    filepath="/anchor_analysis/fasta_files_r4/$hla_allele/anchor_${length}mer_input.fa"
    echo $filepath
    mkdir -p "/anchor_analysis/output_files_r4/$hla_allele/anchor_${length}mer_output/"
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false bsub -q research-hpc -a 'docker(susannakiwala/pvactools:1.5.0b)' -J "anchor_analysis_${COUNT}" -M 8000000 -R 'select[mem>=8000] rusage[mem=8000]' \
    -g '/user/h.xia/sat_analysis_20' -oo "/anchor_analysis/logs_r4/sample_${hla_allele}_${length}.out" \
    -e "/anchor_analysis/logs_r4/sample_${hla_allele}_${length}.err" \
    pvacbind run -e $length --iedb-install-directory /opt/iedb --iedb-retries 50 --binding-threshold 500 --allele-specific-binding-thresholds --keep-tmp-files --n-threads 8 \
    $filepath "ANCHOR" $hla_allele MHCflurry MHCnuggetsI NetMHC NetMHCcons NetMHCpan PickPocket SMM SMMPMBEC \
    "/anchor_analysis/output_files_r4/$hla_allele/anchor_${length}mer_output/"
    echo "Count:${COUNT}, HLA:${hla_allele}, length:${length}"
    if (($COUNT == 1))
    then
        echo "Count:${COUNT}, HLA:${hla_allele}, length:${length}" > anchor_jobs_matchlist.txt
    fi
    echo "Count:${COUNT}, HLA:${hla_allele}, length:${length}" >> anchor_jobs_matchlist.txt
    if (($COUNT % 25 == 0))
    then
        sleep 1h
    fi
    COUNT=$((COUNT+1))
    sleep 5s
done < "$1"
