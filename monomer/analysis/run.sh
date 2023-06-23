#!/bin/bash

rm -rf rmsd_monomer.xvg binding_ene.xvg tmp

for i in {1..5}
do

mk_export.py ../x77_vina_run_${i}_monomer.pdbqt -o run${i}_out_monomer.sdf

obrms run${i}_out_monomer.sdf ../6w63_B_X77.sdf >> tmp

sed -r 's/^RMSD :X77 //' tmp > rmsd_mono.xvg

grep -A11 "(kcal/mol)" ../run_${i}_monomer.log  | tail -n9 | awk '{print $2}' >> binding_ene_mono.xvg

done
