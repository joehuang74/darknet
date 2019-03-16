#!/bin/bash
# yolo-v3
cd ..
# ./darknet detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel.cfg yolov3-tiny.weights
./darknet detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-voc-n5-tunnel.cfg darknet53.conv.74