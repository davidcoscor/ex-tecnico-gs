### Execução da Imagem Docker
Para executar a imagem docker, a partir deste repositório:
```bash
git clone https://github.com/davidcoscor/vari-gene.git
cd vari-gene
docker build -t vari-gene .
docker run -it vari-gene
```

### Questões de Interpretação
As respostas para as questões de interpretação podem ser encontradas no ficheiro `respostas.txt`. O código utilizado para responder a cada uma delas (para a 3.2. não foi utilizado código) está no diretório `src` (e pode ser executado na imagem Docker - `$ src/3_N.sh`). Abaixo segue uma descrição mais detalhada sobre os comandos e opções utilizados:

#### `samtools view`
É utilizado para analisar o conteúdo de um ficheiro SAM/BAM e para converter entre estes formatos.

Opções utilizadas:
- `-c`: para obter o número de reads.
- `-f <N>`: para filtrar o resultado segundo um determinado código `N`. Foi utilizado `N=4` para obter apenas as reads não mapeadas.

#### `bcftools view`
É utilizado para analisar o conteúdo de um ficheiro VCF/BCF e para converter entre entes formatos.

Opções utilizadas:
- `-H`: para excluir o cabeçalho do resultado.
- `-i <CONDITION>`: para incluir apenas variantes que cumpram a condição dada. Por exemplo a condição `QUAL>100`, faz com que apenas as variantes com qualidade superior a 100 sejam incluídas no resultado. 

#### `bcftools stats`
É utilizado para produzir um relatório com estatísticas referentes a um ficheiro VCF/BCF.
Neste exercício, foi utilizado em conjunto com o comando `grep`, para obter o rácio Ti/Tv, uma medida da qualidade da identificação de variantes.

#### `bcftools query -f <FIELD>`
É utilizado para extrair campos específicos de ficheiros VCF/BCF. Por exemplo, `-f '%INFO/GENE\n'` retorna o nome do gene de cada variante. Neste exercício foi utilizado em conjunto com o comando `uniq`, para contar o número de variantes identificadas para cada gene.

#### `bcftools filter`
É utilizado para aplicar filtros em variantes, segundo dadas condições (na prática, editando o campo FILTER em ficheiros VCF).
Neste exercício foi utilizado: 1) na pergunta 3.1., em conjunto com o comando `bcftools query`, para retornar o nome dos genes apenas das variantes com qualidade superior a 100 e profundidade superior a 50 (valores meramente exemplificativos) e 2) na pergunta 3.3. para identificar as variantes patogénicas para o gene NTHL1.

Opções utilizadas:
- `-i <CONDITION>`: para marcar todas as variantes que não cumpram a condição dada com `PASS`.
- `-o <FILE>`: para identificar o ficheiro de output.
