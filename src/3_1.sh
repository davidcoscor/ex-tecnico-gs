#!/bin/bash

echo "Número de reads mapeadas: \
$(samtools view -c ./ficheiros_Amostra_A/AMOSTRA_A.bam)"

echo -e "Número de reads não mapeadas: \
$(samtools view -c -f 4 ./ficheiros_Amostra_A/AMOSTRA_A.bam)"

echo -e "\nNúmero de variantes: \
$(bcftools view -H ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf | wc -l)"

echo -e "Número de variantes com qualidade > 100: \
$(bcftools view -H -i 'QUAL>100' ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf | wc -l)"

echo -e "Número de variantes com profundidade > 50: \
$(bcftools view -H -i 'INFO/DP>=50' ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf | wc -l)"

echo -e "Ti/Tv: \
$(bcftools stats ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf | grep TSTV | grep -v '^#' | cut -f5)"

echo -e "\nNúmero de variantes por gene: \
\n$(bcftools query -f '%INFO/GENE\n' ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf | sort | uniq -c)"

echo -e "\nNúmero de variantes por gene com qualidade > 100 e profundidade > 50: \
\n$(bcftools filter -i 'QUAL>100 && INFO/DP>=50' ./ficheiros_Amostra_A/AMOSTRA_A.anotada.vcf | bcftools query -f '%INFO/GENE\n' | sort | uniq -c)"