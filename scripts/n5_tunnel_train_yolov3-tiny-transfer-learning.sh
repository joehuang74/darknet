#!/bin/bash
# yolo-v3
cd ..
# 1. No Transfer learning, no pre-trained model, 30000 batches
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg

# 2. Transfer learning (stopbackward=1 at layer 18), No pre-trained model (Should be terrible), 10000 batches
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb18.cfg

# 3. Transfer learning (stopbackward=1 at layer 18), pre-trained model (From #1), 10000 batches, -clear to start training from batch #0
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb18.cfg yolov3-tiny-n5-tunnel.weights -clear

# 4. Transfer learning (stopbackward=1 at layer 22), pre-trained model (From #1), 10000 batches. -clear to start training from batch #0
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb22.cfg yolov3-tiny-n5-tunnel.weights -clear

# 5. Transfer learning (stopbackward=1 at layer 18), pre-trained model (From https://pjreddie.com/darknet/yolo/), 10000 batches. -clear to start training from batch #0
./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb18.cfg yolov3-tiny.weights -clear

# 6. Transfer learning (stopbackward=1 at layer 22), pre-trained model (From https://pjreddie.com/darknet/yolo/), 10000 batches. -clear to start training from batch #0
#./darknet-gpu detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb22.cfg yolov3-tiny.weights -clear
