#!/bin/bash 

#SBATCH --export=ALL
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --time=9999:00:00
#SBATCH --export=ALL
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jjami@ucmerced.edu
#SBATCH --partition=pi.amartini
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
#SBATCH --job-name=mecha-chem
#SBATCH --output=logs/job.o%j
#SBATCH --error=logs/job.e%j

export lmp_exec=lmp

# Create output directory structure
mkdir -p output
mkdir -p logs


whoami
pwd
uptime
merced_node_print -d

module load lammps/20230208

#mpirun -np 20 lmp_mpi -in MoS2_crystal_rebo.in > output.txt
mpirun -np 40 $lmp_exec -log logs/lammps.log -in equilibiration_1atm.lmp > output/simulation.out

#./lmp_mpi < in.eqm > out.txt