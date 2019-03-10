#!/bin/bash
cd ..
# Print weights for all layers
./darknet print_all cfg/yolov3-tiny.cfg darknet53.conv.74

# See what happens if cfg and weights do no match (Still look fine!?)
#./darknet print_all n5_tunnel_1000/yolov3-tiny-n5-tunnel.cfg darknet53.conv.74  # This cfg has only 27 filters for layer-22
#./darknet print_all cfg/yolov3-tiny.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu.backup # This weights are trained with cfg which has only 27 filters for layer-22
#./darknet print_all cfg/yolov3-tiny.cfg extraction.conv.weights # This weights are not for yolo-v3

