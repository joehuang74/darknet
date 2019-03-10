#!/bin/bash
cd ..
# Print weights for all layers
./darknet print_all cfg/yolov3-tiny.cfg darknet53.conv.74
#./darknet print_all cfg/yolov3-tiny.cfg darknet.weights # This weights are not for yolo-v3

