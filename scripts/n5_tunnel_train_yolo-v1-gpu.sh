#!/bin/bash
# yolo-v1 tiny
cd ..
./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov1-tiny-n5-tunnel-training-gpu.cfg
