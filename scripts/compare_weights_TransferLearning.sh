#!/bin/bash
# Demo: Transfer Learning
# 1. Compare the weights of PRE-trained weights(darknet53.conv.74) and trained weights
# 2. Add a parameter stopbackward=1 in layer-18 in the cfg, train and compare again, 
#     the trained weights in layer-18 and layers before it should be the same as darknet53.conv.74.

cd ~/git/darknet.git
# Print weights for darknet53.conv.74 from layer-0 to layer-22
for i in `echo 0 2 4 6 8 10 12 13 14 15 18 21 22`
do
	echo "./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg darknet53.conv.74 $i"
	./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg darknet53.conv.74 $i > darknet53.conv.74.$i
	echo "./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu_100.weights $i"
	./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu_100.weights $i > yolov3-tiny-n5-tunnel-training-gpu_100.weights.$i
done

for i in `echo 0 2 4 6 8 10 12 13 14 15 18 21 22`
do
	if [ "`diff darknet53.conv.74.$i yolov3-tiny-n5-tunnel-training-gpu_100.weights.$i`" == "" ]; then
		echo "Weights in layer-$i is the same."
	else
		echo "Weights in layer-$i is NOT the same."
	fi
done

