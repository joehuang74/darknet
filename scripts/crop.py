# Read box labels from txt(Annotations) files and extract the box images to jpg
import sys, os
sys.path.append(os.path.join(os.getcwd(),'python/'))
import darknet as dn

os. chdir("/home/j/git/darknet.git")
dn.set_gpu(0)

def crop_image(image_dir, label_dir, output_dir, image_file):
    im = dn.load_image(image_dir + "/" + image_file, 0, 0)
    num = dn.c_int(0)
    pnum = dn.pointer(num)
    p_box_labels = dn.read_boxes(label_dir + "/" + image_file.replace(".jpg", ".txt"), pnum)
    print "# Cropping for " + image_file + " with size >= 3000"
    print "  num of boxes = " + str(num.value)
    #print "  box_labels: "
    for i in range(num.value):
        id = p_box_labels[i].id
        x = p_box_labels[i].x * im.w
        y = p_box_labels[i].y * im.h
        w = p_box_labels[i].w * im.w
        h = p_box_labels[i].h * im.h
        #print str(id) + " " + str(x) + " " + str(y) + " " + str(w) + " " + str(h)
        if w*h >= 3000:
            cropped_im = dn.crop_image(im, int(x-w/2), int(y-h/2), int(w), int(h))
            #dn.show_image(cropped_im, "Detected image", 500)
            dn.save_image(cropped_im, output_dir + "/" + image_file.replace(".jpg", "_" + str(i)))
            print "  Cropped " + image_file.replace(".jpg", "_" + str(i) + ".jpg") + " (Size: " + str(int(w*h)) + ")"
        else:
            print "  Ignored " + image_file.replace(".jpg", "_" + str(i) + ".jpg") + " (Size: " + str(int(w*h)) + ")"
    print ""
    dn.free_image(im)

image_dir = "/home/j/data/n5_tunnel_extracted_images_darknet_1000/tmptest"
label_dir = "/home/j/data/n5_tunnel_extracted_pseudo_labels_darknet_1000/tmptest"
output_dir = "/home/j/data/n5_tunnel_extracted_detections_darknet_1000/tmptest"
for image_file in os.listdir(image_dir):
    if image_file.endswith(".jpg"):
        crop_image(image_dir, label_dir, output_dir, image_file)
    else:
        continue
