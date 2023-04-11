#!/bin/bash
source ../scripts/init.sh -DBACKEND=mix -DSHOW_SUMMARY=on -DSHOW_SCHEDULE=on -DMICRO_BENCH=on -DUSE_DOUBLE=on -DDISABLE_ASSERT=off -DENABLE_OVERLAP=on -DMEASURE_STAGE=off -DEVALUATOR_PREPROCESS=on -DUSE_MPI=on -DMAT=7
`which mpirun` -host 172.31.13.121 -x GPUPerRank=1 ../scripts/env.sh ../scripts/gpu-bind.sh ./main ../../quartz-master/circuit/MQTBench_28q/qft_indep_qiskit_28.qasm
