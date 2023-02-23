import numpy as np
import pandas as pd
import sys
import os
import pickle

random_peptide_sets=sys.argv[1]
round_num = 4

amino_acids = ['A', 'R', 'N', 'D', 'C', 'E', 'Q', 'G', 'H', 'I', 'L', 'K', 'M', 'F', 'P', 'S', 'T', 'W', 'Y', 'V']

def all_possible_mutations(peptides):
    new_peptides = []
    for i in peptides:
        #print(i)
        for j in range(0, len(i)):
            for k in amino_acids:
                new_peptide = i[:j]+k+i[j+1:]
                #print(new_peptide)
                new_peptides.append(new_peptide)
        #break
    return new_peptides

def load_obj(name ):
    with open('obj/' + name + '.pkl', 'rb') as f:
        return pickle.load(f)

peptide_dict = load_obj(random_peptide_sets)

hla_allele_file = open("/anchor_analysis/pvacbind_run_lookup.txt", 'w+')
for i in peptide_dict.keys():
    outdir = "/anchor_analysis/fasta_files_r"+str(round_num)+"/"+i
    if not os.path.exists(outdir):
        os.makedirs(outdir)
    for j in peptide_dict[i].keys():
        print(i,j)
        hla_allele_file.write(i+","+str(j)+'\n')
        all_mutated_peptides = all_possible_mutations(peptide_dict[i][j])
        fasta_file = open(outdir+"/anchor_"+str(j)+"mer_input.fa", 'w+')
        for m,n in enumerate(all_mutated_peptides):
            fasta_file.write(">"+str(m+1)+'\n')
            fasta_file.write(n+'\n')
        fasta_file.close()
    print("Done: "+i)
hla_allele_file.close()
    
