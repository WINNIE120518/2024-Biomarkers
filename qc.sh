#!/usr/bin/sh
#SBATCH -A MST109178        # Account name/project number
#SBATCH -J fastqc         # Job name
#SBATCH -p ngs7G           # Partition Name 等同PBS裡面的 -q Queue name
#SBATCH -c 1               # 使用的core數 請參考Queue資源設定
#SBATCH --mem=7g           # 使用的記憶體量 請參考Queue資源設定
#SBATCH -o out_fastqc.log          # Path to the standard output file
#SBATCH -e err_fastqc.log
#SBATCH --mail-user=
#SBATCH --mail-type=END

# Please enter the R1 & R2 file name and your username
R1=SEA_L001_R1_001
R2=SEA_L001_R2_001
user=u2499286

fastqdir=/work/u2499286/thalassemia_pipeline_course/fastq
R1_file=${fastqdir}/${R1}.fastq.gz
R2_file=${fastqdir}/${R2}.fastq.gz
## Set up the environment for running fastqc
module load biology
module load FastQC

## Analyzing your sample's sequence QC by fastqc
fastqc ${R1_file} ${R2_file} -o /work/${user}/result
