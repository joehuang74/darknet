#!/bin/bash
# yolo-v3
cd ..
./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg darknet53.conv.74
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg

#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-voc-n5-tunnel-training-gpu.cfg darknet53.conv.74
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-voc-n5-tunnel-training-gpu.cfg
