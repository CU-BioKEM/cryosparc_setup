#!/bin/bash
#SBATCH --partition=blanca-biokem
#SBATCH --qos=blanca-biokem
#SBATCH --account=blanca-biokem
#SBATCH --nodes=1
#SBATCH --ntasks={{ num_cpu }}
#SBATCH --gres=gpu:{{ num_gpu }}
#SBATCH --time=24:00:00
#SBATCH --mem={{ (ram_gb*2)|int }}GB
#SBATCH --job-name=cspark_{{ project_uid }}_{{ job_uid }}
#SBATCH --output={{ job_log_path_abs }}
#SBATCH --error={{ job_log_path_abs }}

{{ run_cmd }}
