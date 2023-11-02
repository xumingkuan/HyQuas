#!/bin/bash
#source ../scripts/env.sh ""
#mkdir -p $HYQUAS_ROOT/build
#cd $HYQUAS_ROOT/build
source ../scripts/init.sh -DBACKEND=mix -DSHOW_SUMMARY=on -DSHOW_SCHEDULE=on -DMICRO_BENCH=on -DUSE_DOUBLE=on -DDISABLE_ASSERT=off -DENABLE_OVERLAP=off -DMEASURE_STAGE=off -DEVALUATOR_PREPROCESS=on -DUSE_MPI=off -DMAT=7
# CUDA_VISIBLE_DEVICES=0,1,2,3 ./main ../tests/input/supremacy_28.qasm
# ./main ../../quartz-master/circuit/MQTBench_42q/qft_indep_qiskit_42.qasm > ../tests/42_qft.log
# ./main ../../quartz-master/circuit/MQTBench_42q/aem_indep_qiskit_42.qasm > ../tests/42_ae.log
# ./main ../../quartz-master/circuit/MQTBench_42q/ghz_indep_qiskit_42.qasm > ../tests/42_ghz.log
# ./main ../../quartz-master/circuit/MQTBench_42q/graphstate_indep_qiskit_42.qasm > ../tests/42_graphstate.log
# ./main ../../quartz-master/circuit/MQTBench_42q/qftentangled_indep_qiskit_42.qasm > ../tests/42_qftentangled.log
# ./main ../../quartz-master/circuit/MQTBench_42q/qpeexactm_indep_qiskit_42.qasm > ../tests/42_qpeexact.log
# ./main ../../quartz-master/circuit/MQTBench_42q/qpeinexactm_indep_qiskit_42.qasm > ../tests/42_qpeinexact.log
# ./main ../../quartz-master/circuit/MQTBench_42q/realamprandom_indep_qiskit_42.qasm > ../tests/42_realamprandom.log
# ./main ../../quartz-master/circuit/MQTBench_42q/twolocalrandom_indep_qiskit_42.qasm > ../tests/42_twolocalrandom.log
export names="ae dj ghz graphstate qft qftentangled qpeexact su2random wstate"
for name in ${names[*]}; do
  echo "$name"
  # ls "../../quartz-master/circuit/MQTBench_28q/${name}_indep_qiskit_28.qasm"
  for numq in {28..34}; do
    # ./main2 ../../quartz-master/circuit/MQTBench_${numq}q/${name}_indep_qiskit_${numq}.qasm > tmp.log
    ./main2 ../circuit/MQTBench_${numq}q/${name}_indep_qiskit_${numq}_no_swap.qasm > tmp.log
    # grep "Number of global qubits" tmp.log
    grep "cost =" tmp.log | cut -c 8-
    # grep "stage" tmp.log
    # grep "total" tmp.log
  done
done
