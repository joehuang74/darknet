#!/bin/bash
# Print network filter trained weights for one of the convolutional layers, the conv weights have been initialized randomly with normal distribution,
#  so the weights still "appear to be fine" even if the weight file does not match with the network config. See convolutional_layer.c for details:
#  for(i = 0; i < l.nweights; ++i) l.weights[i] = scale*rand_normal();
#  Change scale*rand_normal() to 0 and print_weights again, when the weight file does not contain enough weights, you can see 0 being printed.

cd ..

# Print layer-0 weights
./darknet print cfg/yolov3-tiny.cfg yolov3-tiny.weights 0
#./darknet print cfg/yolov3-tiny.cfg darknet.weights 0 # This weights are not for yolo-v3, see what happens

# Print layer-6 weights
./darknet print cfg/yolov3-tiny.cfg yolov3-tiny.weights 6
#./darknet print cfg/yolov3-tiny.cfg darknet.weights 6 # This weights are not for yolo-v3, see what happens

# Print layer-22 weights
./darknet print cfg/yolov3-tiny.cfg yolov3-tiny.weights 22
#./darknet print cfg/yolov3-tiny.cfg darknet.weights 22 # This weights are not for yolo-v3, see what happens
