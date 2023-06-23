#!/bin/bash

rm -rf rmsd_dimer.xvg binding_ene.xvg tmp

for i in {1..5}
do

mk_export.py ../x77_vina_run${i}_dimer.pdbqt -o run${i}_out_dimer.sdf

obrms run${i}_out_dimer.sdf ../6w63_B_X77.sdf >> tmp

sed -r 's/^RMSD :X77 //' tmp > rmsd_dimer.xvg

grep -A11 "(kcal/mol)" ../run_${i}_dimer.log  | tail -n9 | awk '{print $2}' >> binding_ene_dimer.xvg

done
