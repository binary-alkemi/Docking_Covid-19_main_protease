# Docking X77 to 6w63 monomer vs homodimer

PDB 6w63 is a structure of COVID-19 main protease bound to potent broad-spectrum non-covalent inhibitor X77. This docking experiment is repeated five times for better statistics. 

The biological assembly of this structure is homo-2-mer (dimer). 

I found some of the published papers used monomer unit for docking and others dimer unit. 

There are couple of  terminal residues within 5 Å of ligand X77.

Here, the objective is to check if is there any difference if monomer or dimer units are considered. 

If docking is evaluated by molecular dynamics simulation, dimer unit should be used as it indicate biological assembly.
=======
In my opinion, if docking is further evaluated by long MD simulation or MM/PBSA studies, dimer unit should be used as it represents biological assembly.

The results are shown in figure below:

![My Image](plotting/homodimer_monomer_6W63.png)
