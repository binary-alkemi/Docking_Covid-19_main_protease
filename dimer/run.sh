#!/bin/bash

# download biological assembly from RCSB PDB databank.
# both units have same chainID, change it to A and B manually.

#  reduce 6w63._A.pdb > reduce.pdb

#  ~/softwares/Autodock_ADFR/ADFRsuite_x86_64Linux_1.0/bin/prepare_receptor -r reduce.pdb -o receptor.pdbqt

#mk_prepare_ligand.py -i 6w63_B_X77.sdf -o 6w63_ligand.pdbqt

#pythonsh ~/softwares/vina_github/AutoDock-Vina/example/autodock_scripts/prepare_gpf.py -l 6w63_ligand.pdbqt -r receptor.pdbqt -y

#autogrid4 -p receptor.gpf -l drug.glg


rm -rf binding_ene_dimer.xvg rmsd_lb_dimer.xvg

for i in {1..5}
do

~/softwares/Autodock_vina2021/vina_1.2.3_linux_x86_64  --ligand 6w63_ligand.pdbqt --maps receptor --scoring ad4 --exhaustiveness 32 --out x77_vina_run"$i"_dimer.pdbqt > run_"$i"_dimer.log

done

for i in {1..5}
do
## binding energy
echo "#run_$i" >> binding_ene_dimer.xvg

grep -A 11 run_"$i"_dimer.log  | awk '{print $2}' | tail -n8 >> binding_ene_dimer.xvg

### rmsd lb
echo "#run_$i" >> rmsd_lb_dimer.xvg

grep -A 11 run_"$i"_dimer.log  | awk '{print $3}' | tail -n8 >> rmsd_lb_dimer.xvg


done

tail -n9 run_*_dimer.log > alltrial_data_dimer.dat
