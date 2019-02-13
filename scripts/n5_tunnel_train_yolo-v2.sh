#!/bin/bash
# yolo-v2
cd ..
# ./darknet detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov2-tiny-n5-tunnel.cfg darknet19_448.conv.23
./darknet detector train n5_tunnel_1000/obj.data n5_tunnel_1000/yolov2-voc-n5-tunnel.cfg darknet19_448.conv.23