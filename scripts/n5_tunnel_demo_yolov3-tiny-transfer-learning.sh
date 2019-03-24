#!/bin/bash
# yolo-v3
VIDEO="/home/j/data/n5_tunnel_extracted_images_darknet_1000/nfbCCTV-N5-S-18.2993-M.mp4"

cd ~/git/darknet.git

# 0. Pre-trained model(From https://pjreddie.com/darknet/yolo/), no detections at all, the weights do not match with cfg(The number of classes has been modified by me)
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny.weights ${VIDEO}

# 1. No Transfer learning, no pre-trained model, 30000 batches (works ok)
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny-n5-tunnel.weights ${VIDEO}

# 2. Transfer learning (stopbackward=1 at layer 18), No pre-trained model (Should be terrible), 10000 batches
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb18.cfg yolov3-tiny-n5-tunnel-sb18-no-pretrained.weights ${VIDEO}

# 3. Transfer learning (stopbackward=1 at layer 18), pre-trained model (From #1), 10000 batches (works ok)
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb18.cfg yolov3-tiny-n5-tunnel-sb18-pretrained.weights ${VIDEO}

#4. Transfer learning (stopbackward=1 at layer 22), pre-trained model (From #1), 10000 batches. (works ok)
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb22.cfg yolov3-tiny-n5-tunnel-sb22-pretrained.weights ${VIDEO}

# 5. Transfer learning (stopbackward=1 at layer 18), pre-trained model (From https://pjreddie.com/darknet/yolo/), 10000 batches. (works ok)
./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb18.cfg yolov3-tiny-n5-tunnel-sb18-pretrained-pjreddie.weights ${VIDEO}

# 6. Transfer learning (stopbackward=1 at layer 22), pre-trained model (From https://pjreddie.com/darknet/yolo/), 10000 batches. (doesn't work)
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-sb22.cfg yolov3-tiny-n5-tunnel-sb22-pretrained-pjreddie.weights ${VIDEO}
