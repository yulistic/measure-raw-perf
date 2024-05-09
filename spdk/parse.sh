#!/bin/bash

if [ -z $1 ]; then
	echo "result directory path is required."
fi

result_dir=$1


# Independent (manipulated) variables: qdepth - single core
echo "qdepth - 1 core"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QDEPTHS="1 2 4 8 16 32 64"
for qdepth in $QDEPTHS; do
	file="$result_dir/4096_randwrite_${qdepth}_1_0x10000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""

# Independent (manipulated) variables: qdepth - 2 cores
echo "qdepth - 2 cores"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QDEPTHS="1 2 4 8 16 32 64"
for qdepth in $QDEPTHS; do
	file="$result_dir/4096_randwrite_${qdepth}_1_0x30000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""

# Independent (manipulated) variables: qdepth - 4 cores
echo "qdepth - 4 cores"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QDEPTHS="1 2 4 8 16 32 64"
for qdepth in $QDEPTHS; do
	file="$result_dir/4096_randwrite_${qdepth}_1_0xf0000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""

# Independent (manipulated) variables: qdepth, max resources (4 qpair, 4 cores)
echo "qdepth - 4 qpairs 4 cores"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QDEPTHS="1 2 4 8 16 32 64"
for qdepth in $QDEPTHS; do
	file="$result_dir/4096_randwrite_${qdepth}_4_0xf0000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""

# Independent (manipulated) variables: qpair - single core
echo "qpair - 1 core"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QPAIRS="1 2 4"
for qpair in $QPAIRS; do
	file="$result_dir/4096_randwrite_1_${qpair}_0x10000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""

# Independent (manipulated) variables: qpair - 2 cores
echo "qpair - 2 cores"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QPAIRS="1 2 4"
for qpair in $QPAIRS; do
	file="$result_dir/4096_randwrite_1_${qpair}_0x30000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""

# Independent (manipulated) variables: qpair - 4 cores
echo "qpair - 4 cores"
echo "iosize_op_qdepth_qpair_core,iops,tput(MiB/s),avg(us),min,max"
QPAIRS="1 2 4"
for qpair in $QPAIRS; do
	file="$result_dir/4096_randwrite_1_${qpair}_0xf0000"
	echo -n "$(basename $file),"
	grep -h "Total" $file | xargs | cut -d " " -f 3-7 --output-delimiter=","
done
echo ""
