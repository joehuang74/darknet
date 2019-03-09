#!/bin/bash
# yolo-v3
cd ..

mkdir detected_results

for img in `cat n5_tunnel_1000/testset.txt`
do
	echo "${img}"
	./darknet-gpu detector test n5_tunnel_1000/obj.data  n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu.backup ${img} -out ./detected_results/`basename ${img}`
done

