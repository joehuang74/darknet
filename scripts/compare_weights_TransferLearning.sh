#!/bin/bash
# Compare the weights of PRE-trained weights(yolov3-tiny.weights) and trained weights
# Demo: Transfer Learning
# 1. Train a model with cfg/yolov3-tiny.cfg and PRE-trained weights(yolov3-tiny.weights)
# 2. Run this script to compare the weights of PRE-trained weights(yolov3-tiny.weights) and trained weights.
# 3. Add a parameter stopbackward=1 in layer-18 in the cfg, then train and compare again, 
#     you should see the trained weights in layer-18 and layers before it are the same as yolov3-tiny.weights.

cd ~/git/darknet.git
# Print weights from layer-0 to layer-22
for i in `echo 0 2 4 6 8 10 12 13 14 15 18 21 22`
do
	echo "./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny.weights $i"
	./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny.weights $i > yolov3-tiny.weights.$i
	echo "./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu_100.weights $i"
	./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu_100.weights $i > yolov3-tiny-n5-tunnel-training-gpu_100.weights.$i
done

for i in `echo 0 2 4 6 8 10 12 13 14 15 18 21 22`
do
	if [ "`diff yolov3-tiny.weights.$i yolov3-tiny-n5-tunnel-training-gpu_100.weights.$i`" == "" ]; then
		echo "Weights in layer-$i is the same."
	else
		echo "Weights in layer-$i is NOT the same."
	fi
done

