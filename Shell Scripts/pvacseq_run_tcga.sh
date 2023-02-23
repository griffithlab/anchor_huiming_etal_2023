#!/bin/bash

COUNT=1
sub_dir="TCGA_1000_m1"
mkdir -p "/anchor_analysis/anchor_evaluation/${sub_dir}/pvacseq_re/logs"
while IFS='' read -r line || [[ -n "$line" ]]
do
    patient_id=$(echo $line | cut -d$' ' -f1)
    hla_types=$(echo $line | cut -d$' ' -f2)
    echo $hla_types
    vcf_file_path="/anchor_analysis/anchor_evaluation/${sub_dir}/${patient_id}_final_edit.vcf"
    echo $vcf_file_path
    
    mkdir -p "/anchor_analysis/anchor_evaluation/${sub_dir}/pvacseq_re/${patient_id}_${COUNT}"
    
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false bsub -oo "/anchor_analysis/anchor_evaluation/${sub_dir}/pvacseq_re/logs/pvacseq_$COUNT.log" \
    -J anchor_analysis_${sub_dir}_${COUNT} -q research-hpc -n 8 -M 16000000 -R 'select[mem>16000] span[hosts=1] rusage[mem=16000]' \
    -a 'docker(griffithlab/pvactools:2.0.0)' -g '/gscuser/h.xia/anchor_20' pvacseq run -e 8,9,10,11 --iedb-install-directory '/opt/iedb' --iedb-retries 50 \
    --keep-tmp-files --n-threads 16 --normal-sample-name NORMAL \
    --downstream-sequence-length 500 --minimum-fold-change 0 --trna-cov 0 --normal-vaf 0.01 --tdna-vaf 0 --trna-vaf 0 \
    --pass-only "${vcf_file_path}" TUMOR_NEW "${hla_types}" MHCflurry MHCnuggetsI NetMHC NetMHCpan PickPocket SMM SMMPMBEC NetMHCcons \
    "/anchor_analysis/anchor_evaluation/${sub_dir}/pvacseq_re/${patient_id}_${COUNT}"
    COUNT=$((COUNT+1))
    #break
    if (($COUNT % 10 == 0))
    then
        sleep 20m
    fi 
    sleep 5s
    #break
done < "$1"
