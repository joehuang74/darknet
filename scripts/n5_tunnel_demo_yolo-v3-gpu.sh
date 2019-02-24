#!/bin/bash
# yolo-v3
cd ..
./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-tiny-n5-tunnel-training-gpu.backup /home/j/data/n5_tunnel_extracted_images_darknet_1000/nfbCCTV-N5-S-18.2993-M.mp4
#./darknet-gpu detector demo n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-voc-n5-tunnel-training-gpu.cfg n5_tunnel_1000/backup/yolov3-voc-n5-tunnel-training-gpu.backup /home/j/data/n5_tunnel_extracted_images_darknet_1000/nfbCCTV-N5-S-18.2993-M.mp4
