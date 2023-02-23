#!/bin/bash

COUNT=1
subset="TCGA_1000_m2"
subdir="pvacseq_re"
while IFS='' read -r line || [[ -n "$line" ]]
do
    patient_id=$(echo $line | cut -d$' ' -f1)
    cd "/${subset}/${subdir}/${patient_id}_${COUNT}/MHC_Class_I/"
    
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false bsub -J "filter_500_${subset}_${COUNT}" -oo "filter_b500.log" -q research-hpc -M 8000000 \
    -R 'select[mem>8000] span[hosts=1] rusage[mem=8000]' -a 'docker(griffithlab/pvactools:1.5.2)' -g '/user/h.xia/anchor_20' \
    pvacseq binding_filter -b 500 TUMOR_NEW.all_epitopes.tsv filter_500b.tsv 
    COUNT=$((COUNT+1))
    #break
    if (($COUNT % 26 == 0))
    then
        sleep 4m
    fi 
    sleep 5s
done < "$1"
