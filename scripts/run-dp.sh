#!/bin/bash
#source ../scripts/env.sh ""
#mkdir -p $HYQUAS_ROOT/build
#cd $HYQUAS_ROOT/build
source ../scripts/init.sh -DBACKEND=mix -DSHOW_SUMMARY=on -DSHOW_SCHEDULE=on -DMICRO_BENCH=on -DUSE_DOUBLE=on -DDISABLE_ASSERT=off -DENABLE_OVERLAP=off -DMEASURE_STAGE=off -DEVALUATOR_PREPROCESS=on -DUSE_MPI=off -DMAT=7
# CUDA_VISIBLE_DEVICES=0,1,2,3 ./main ../tests/input/supremacy_28.qasm
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

# NWQBench:
export names="bv ising vqc qsvm"
for name in ${names[*]}; do
  echo "$name"
  for numq in {28..34}; do
    ./main2 ../circuit/NWQBench/${name}_n${numq}_no_swap.qasm > tmp.log
    grep "cost =" tmp.log | cut -c 8-
  done
done
echo "hhl"
./main2 ../circuit/NWQBench/hhl_4_no_swap.qasm > tmp.log
grep "cost =" tmp.log | cut -c 8-
./main2 ../circuit/NWQBench/hhl_7_no_swap.qasm > tmp.log
grep "cost =" tmp.log | cut -c 8-
./main2 ../circuit/NWQBench/hhl_9_no_swap.qasm > tmp.log
grep "cost =" tmp.log | cut -c 8-
./main2 ../circuit/NWQBench/hhl_10_no_swap.qasm > tmp.log
grep "cost =" tmp.log | cut -c 8-
