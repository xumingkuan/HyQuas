#!/bin/bash
# need to uncomment "//    return schedule;" in compiler.cpp first

#source ../scripts/env.sh ""
#mkdir -p $HYQUAS_ROOT/build
#cd $HYQUAS_ROOT/build
source ../scripts/init.sh -DBACKEND=mix -DSHOW_SUMMARY=on -DSHOW_SCHEDULE=on -DMICRO_BENCH=on -DUSE_DOUBLE=on -DDISABLE_ASSERT=off -DENABLE_OVERLAP=off -DMEASURE_STAGE=off -DEVALUATOR_PREPROCESS=on -DUSE_MPI=off -DMAT=7
# CUDA_VISIBLE_DEVICES=0,1,2,3 ./main ../tests/input/supremacy_28.qasm
export names="ae dj ghz graphstate qft qftentangled qpeexact su2random wstate"
for name in ${names[*]}; do
  for numq in 31 42; do
    echo "$name $numq:"
    for globalq in {0..29}; do
      ./main2 ../circuit/MQTBench_${numq}q/${name}_indep_qiskit_${numq}_no_swap.qasm $globalq > tmp.log
      grep "Num Stages: " tmp.log | cut -c 13-
    done
  done
done

# NWQBench:
export names="bv ising vqc qsvm"
for name in ${names[*]}; do
  for numq in 31 42; do
    echo "$name $numq:"
    for globalq in {0..29}; do
      ./main2 ../circuit/NWQBench/${name}_n${numq}_no_swap.qasm $globalq > tmp.log
      grep "Num Stages: " tmp.log | cut -c 13-
    done
  done
done
