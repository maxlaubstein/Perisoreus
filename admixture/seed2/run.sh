for K in 2 3 4 5 6 7 8;
        do
                admixture -s 222 -j15 --cv ../Perisoreus_LDPruned_autosomes.ped $K | tee log${K}.out;
        done
