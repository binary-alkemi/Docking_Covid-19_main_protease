#!/bin/bash

grep -v "X77" 6w63.pdb | grep -v "HOH" > prot.pdb

# download biological assembly from RCSB PDB databank.
# both units have same chainID, change it to A and B manually.

reduce prot.pdb > reduce.pdb

  ~/softwares/Autodock_ADFR/ADFRsuite_x86_64Linux_1.0/bin/prepare_receptor -r reduce.pdb -o receptor.pdbqt

mk_prepare_ligand.py -i 6w63_B_X77.sdf -o 6w63_ligand.pdbqt

pythonsh ~/softwares/vina_github/AutoDock-Vina/example/autodock_scripts/prepare_gpf.py -l 6w63_ligand.pdbqt -r receptor.pdbqt -y

autogrid4 -p receptor.gpf -l drug.glg

~/softwares/Autodock_vina2021/vina_1.2.3_linux_x86_64  --ligand 6w63_ligand.pdbqt --maps receptor --scoring ad4 --exhaustiveness 32 --out x77_vina_monomer.pdbqt
