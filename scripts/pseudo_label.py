# Given an image_dir, apply an detection model and output the detected boxes as "labels" and save to label_dir
import sys, os
sys.path.append(os.path.join(os.getcwd(),'python/'))

import darknet as dn
import pdb

def relative2Original(im, label):
    new_label = list(label)
    new_label[0] = label[0]
    new_label[1] = label[1] * im.w
    new_label[2] = label[2] * im.h
    new_label[3] = label[3] * im.w
    new_label[4] = label[4] * im.h
    return tuple(new_label)

def pseudo_label(darknet, net, meta, image, relative=1, thresh=.5, hier_thresh=.5, nms=.45):
    im = darknet.load_image(image, 0, 0)
    res = pseudo_label(darknet, net, meta, im, relative, thresh=.5, hier_thresh=.5, nms=.45)
    darknet.free_image(im)
    return res
    
def pseudo_label(darknet, net, meta, im, relative=1, thresh=.5, hier_thresh=.5, nms=.45):
    print "  im.w = " + str(im.w) + "   im.h = " + str(im.h)
    num = darknet.c_int(0)
    pnum = darknet.pointer(num)
    darknet.predict_image(net, im)
    dets = darknet.get_network_boxes(net, im.w, im.h, thresh, hier_thresh, None, relative, pnum)
    num = pnum[0]
    if (nms): darknet.do_nms_obj(dets, num, meta.classes, nms);

    res = []
    for j in range(num):
        for i in range(meta.classes):
            if dets[j].prob[i] > 0:
                b = dets[j].bbox
                #res.append((meta.names[i], dets[j].prob[i], (b.x, b.y, b.w, b.h)))
                res.append((i, b.x, b.y, b.w, b.h))
    res = sorted(res, key=lambda x: -x[1])
    darknet.free_detections(dets, num)
    return res


os. chdir("/home/j/git/darknet.git")
dn.set_gpu(0)
net = dn.load_net("n5_tunnel_1000/yolov3-tiny-n5-tunnel-training-gpu.cfg", "yolov3-tiny-n5-tunnel.weights", 0)
meta = dn.load_meta("n5_tunnel_1000/obj.data")
relative = 1
image_dir = "/home/j/data/n5_tunnel_extracted_images_darknet_1000/tmptest"
label_dir = "/home/j/data/n5_tunnel_extracted_pseudo_labels_darknet_1000/tmptest"

print "### image_dir: " + image_dir + " ###"
for imagefile in os.listdir(image_dir):
    if imagefile.endswith(".jpg"):
        labelfile = imagefile.replace(".jpg", ".txt")
        im = dn.load_image(image_dir + "/" + imagefile, 0, 0)
        print "# Pseudo-labeling for " + imagefile
        results = pseudo_label(dn, net, meta, im, relative, thresh=0.25)
        f = open(label_dir + "/" + labelfile, "w")
        for det in results:
           print "  " + str(det[0]) + " " + str(det[1]) + " " + str(det[2]) + " " + str(det[3]) + " " + str(det[4])
           f.write(str(det[0]) + " " + str(det[1]) + " " + str(det[2]) + " " + str(det[3]) + " " + str(det[4]) + "\n")
        f.close()
        print "  Labels written to " + label_dir + "/" + labelfile
        dn.free_image(im)
    else:
        continue


