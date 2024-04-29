#!/bin/bash
DATE=$(date +"%y%m%d-%H%M%S")
SPDK_ROOT="/home/yulistic/temp/spdk"
QUEUE_DEPTH="1 2 4 8 16 32 64"
QUEUE_PAIR="1 2 4"
CORE_MASK="0x10000 0x30000 0xf0000" # Use numa node 1 where 16 cores in each socket. (1, 2, 4 threads)
IO_SIZE="4096"
OP="randwrite"
PINNING="numactl -N1 -m1"
DURATION="20" # Seconds.

RESULT_DIR="results/${DATE}"

mkdir -p $RESULT_DIR

# Sample file name format.
touch $RESULT_DIR/iosize_op_qdepth_qpair_core

for QD in $QUEUE_DEPTH; do
	for QP in $QUEUE_PAIR; do
		for CM in $CORE_MASK; do
			file_path="${RESULT_DIR}"/"${IO_SIZE}_${OP}_${QD}_${QP}_${CM}"
			cmd="sudo $PINNING ${SPDK_ROOT}/build/bin/spdk_nvme_perf -LL -t $DURATION -o $IO_SIZE -w $OP -q $QD -P $QP -c $CM"
			echo $cmd | tee "$file_path"
			$cmd >> "$file_path" # Execute.

			result=$?
			if [ "$result" -ne 0 ];then
				echo "Execution failed."
				exit 1
			fi
		done
	done
done


# sudo build/bin/spdk_nvme_perf -q 64 -o 4096 -w randrw -M 30 -l -t 60 -r "trtype:RDMA adrfam:IPv4 traddr:192.168.14.113 trsvcid:4420 subnqn:oxbow-nvmf"


# -P

