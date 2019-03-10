#!/bin/bash
cd ..

# Print layer-0 weights
./darknet print cfg/yolov3-tiny.cfg darknet53.conv.74 0

# See what happens if cfg and weights do no match (Still look fine!?)
#./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel.cfg darknet53.conv.74 0  # This cfg has only 27 filters for layer-22
#./darknet print cfg/yolov3-tiny.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu.backup 0 # This weights are trained with cfg which has only 27 filters for layer-22
#./darknet print cfg/yolov3-tiny.cfg extraction.conv.weights 0 # This weights are not for yolo-v3

# Print layer-6 weights
#./darknet print cfg/yolov3-tiny.cfg darknet53.conv.74 6

# Print layer-22 weights
#./darknet print cfg/yolov3-tiny.cfg darknet53.conv.74 22

# See what happens if cfg and weights do no match (Still look fine!?)
#./darknet print n5_tunnel_1000/yolov3-tiny-n5-tunnel.cfg darknet53.conv.74 22  # This cfg has only 27 filters for layer-22
#./darknet print cfg/yolov3-tiny.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu.backup 22 # This weights are trained with cfg which has only 27 filters for layer-22
#./darknet print cfg/yolov3-tiny.cfg extraction.conv.weights 22 # This weights are not for yolo-v3
