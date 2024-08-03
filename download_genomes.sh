#!/bin/bash

# Lista de URLs para baixar os genomas
urls=(
    "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/034/359/265/GCA_034359265.1_ASM3435926v1/GCA_034359265.1_ASM3435926v1_genomic.fna.gz"
    "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/023/547/065/GCA_023547065.1_ASM2354706v1/GCA_023547065.1_ASM2354706v1_genomic.fna.gz"
    "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/036/884/655/GCA_036884655.1_Cavendish_Baxijiao_AAA/GCA_036884655.1_Cavendish_Baxijiao_AAA_genomic.fna.gz"
    "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/018/446/385/GCA_018446385.1_Zo_v1.1/GCA_018446385.1_Zo_v1.1_genomic.fna.gz"
    "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/004/837/865/GCA_004837865.1_BananaB_V1/GCA_004837865.1_BananaB_V1_genomic.fna.gz"
)

# Diretório de destino para os downloads
output_dir="genomes"

# Cria o diretório de destino se não existir
mkdir -p "$output_dir"

# Baixa cada URL na lista
for url in "${urls[@]}"; do
    echo "Baixando $url..."
    wget -P "$output_dir" "$url"
done

echo "Todos os genomas foram baixados."

# Descompactar arquivos baixados
echo "Descompactando arquivos..."
for file in "$output_dir"/*.gz; do
    gunzip "$file"
done

echo "Todos os arquivos foram descompactados."
