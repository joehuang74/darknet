#!/bin/bash
python out4yoloLabel.py --dataset ~/data/n5_tunnel_extracted_images_darknet_1000/trainset --xmlset ~/data/n5_tunnel_extracted_images_darknet_1000/trainset_xml --mergein yes
python out4yoloLabel.py --dataset ~/data/n5_tunnel_extracted_images_darknet_1000/testset --xmlset ~/data/n5_tunnel_extracted_images_darknet_1000/testset_xml --mergein yes

