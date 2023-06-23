#!/bin/bash


#grep -v "X77" 6w63.pdb | grep -v "HOH" > prot.pdb

#reduce prot.pdb > reduce.pdb

#~/softwares/Autodock_ADFR/ADFRsuite_x86_64Linux_1.0/bin/prepare_receptor -r reduce.pdb -o receptor.pdbqt

#mk_prepare_ligand.py -i 6w63_B_X77.sdf -o 6w63_ligand.pdbqt

#pythonsh ~/softwares/vina_github/AutoDock-Vina/example/autodock_scripts/prepare_gpf.py -l 6w63_ligand.pdbqt -r receptor.pdbqt -y

#autogrid4 -p receptor.gpf -l drug.glg

#~/softwares/Autodock_vina2021/vina_1.2.3_linux_x86_64  --ligand 6w63_ligand.pdbqt --maps receptor --scoring ad4 --exhaustiveness 32 --out x77_vina_monomer.pdbqt

rm -rf binding_ene_monomer.xvg rmsd_lb_monomer.xvg

for i in {1..5}
do
~/softwares/Autodock_vina2021/vina_1.2.3_linux_x86_64  --ligand 6w63_ligand.pdbqt --maps receptor --scoring ad4 --exhaustiveness 32 --out x77_vina_run_"$i"_monomer.pdbqt > run_"$i"_monomer.log

done

for i in {1..5}
do

### rmsd lb
echo "#run_$i" >> binding_ene_monomer.xvg

grep -A 11 run_"$i"_monomer.log  | awk '{print $2}' | tail -n8 >> binding_ene_monomer.xvg

## binding energy
echo "#run_$i" >> rmsd_lb_monomer.xvg

grep -A 11 run_"$i"_monomer.log  | awk '{print $3}' | tail -n8 >> rmsd_lb_monomer.xvg



done
