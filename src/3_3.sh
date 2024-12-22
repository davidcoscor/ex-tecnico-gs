#!/bin/bash

bcftools filter -i 'INFO/CLASSIFICATION="Pathogenic" && INFO/GENE~"NTHL1"' ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf \
                -o ./ficheiros_Amostra_A/AMOSTRA_A_NTHL1.vcf

bcftools view -H ./ficheiros_Amostra_A/AMOSTRA_A_NTHL1.vcf