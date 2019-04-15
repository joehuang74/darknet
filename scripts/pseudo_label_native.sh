#!/bin/bash
# Only for code study
cd ~/git/darknet.git

for img in `find /home/j/data/n5_tunnel_extracted_images_darknet_1000/tmptest -name "*.jpg"`
do
	echo $img
	./darknet detector label n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny-n5-tunnel.weights $img -thresh 0.25
done

#find /home/j/data/n5_tunnel_extracted_images_darknet_1000/tmptest -name "*.jpg" | xargs -I $ ./darknet detector test n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny-n5-tunnel.weights $ -thresh 0.25
#./darknet detector test n5_tunnel_1000/obj.data n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg yolov3-tiny-n5-tunnel.weights -thresh 0.25 /home/j/data/n5_tunnel_extracted_images_darknet_1000/testset/160115.jpg 
