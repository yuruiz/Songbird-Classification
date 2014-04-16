
import os
import numpy as np
import pylab as plt
import matplotlib.cm as cm

from scipy import ndimage
from scipy import misc
from PIL import Image, ImageDraw, ImageOps


# def crop(img):
#     original_length = img.shape[1]
#     original_width  = img.shape[0]
#     crop_length = 250
#     top_crop_width = 180
#     bottom_crop_width = 120

#     cropped_length = original_length - 2*crop_length
#     cropped_width  = original_width - top_crop_width - bottom_crop_width

#     cropped = np.zeros((cropped_width, cropped_length))

#     for x in xrange(top_crop_width,img.shape[0] - bottom_crop_width):
#         cropped[x - top_crop_width] = img[x][crop_length:(img.shape[1] - crop_length)]

#     return cropped

def noise_reduction(img, file_name):
    colum_median = np.median(img, axis=0)
    row_median = np.median(img, axis=1)

    media_factor = 1.2

    for x in xrange(0, img.shape[0]):
        for y in xrange(0,img.shape[1]):
            if img[x][y] < colum_median[y]/media_factor and img[x][y] < row_median[x]/media_factor:
                img[x][y] = 255
            else:
                img[x][y] = 0


    eroded_img = ndimage.binary_erosion(img)
    reconstruct_img = ndimage.binary_propagation(eroded_img, mask=img)
    tmp = np.logical_not(reconstruct_img)
    eroded_tmp = ndimage.binary_erosion(tmp)
    reconstruct_final = np.logical_not(ndimage.binary_propagation(eroded_tmp, mask=tmp))
    # eroded_tmp.show()


    labeled, num_features  = ndimage.measurements.label(reconstruct_final.astype(np.int))
    area = ndimage.measurements.sum(reconstruct_final, labeled, index=np.arange(1, labeled.max() + 1))

    # valid_area_count = 0
    # area_threshould = 500

    # for x in xrange(0,num_features):
    #     if area[x] > area_threshould:
    #         valid_area_count += 1

    labels = ndimage.measurements.find_objects(labeled, max_label= num_features)


    segment_dir = "." + "/Features"+file_name.strip(".png") + "/"
    print segment_dir
    if not os.path.exists(segment_dir):
        os.makedirs(segment_dir)

    plot_count = 0
    vector_length = 10
    area_permutation = area.argsort()[::-1]

    record = open(segment_dir + os.path.basename(file_name).strip(".png") + ".txt", "w")
    for x in xrange(0, vector_length):
        # plt.subplot(1, valid_area_count, plot_count+1)
        if x < len(area_permutation):
            (y_1, y_2, step_1) = labels[area_permutation[x]][0].indices(reconstruct_final.shape[0])
            (x_1, x_2, step_2) = labels[area_permutation[x]][1].indices(reconstruct_final.shape[1])

            # Cut features into pieces and save as png files
            # img_file = segment_dir + os.path.basename(file_name).strip(".png") + "_segment_" + str(plot_count) + ".png"
            # misc.imsave(img_file, reconstruct_final[labels[area_permutation[x]]])
            record.write(str(x_1) + "," + str(y_1) + "," + str(x_2) +"," + str(y_2) + "\n")
        else:
            record.write("0" + "," + "0" + "," + "0" +"," + "0" + "\n")

            # toinvert = Image.open(img_file)
            # inverted = ImageOps.invert(toinvert)
            # inverted.save(img_file)

            plot_count += 1


if __name__ == '__main__':

    rootDir = "./Specgram/SongBirdData/"

    list_dirs = os.walk(rootDir)

    file_count = 1
    for root, dirs, files in list_dirs:
        for f in files:
            file_name = os.path.join(root, f)
            if file_name.endswith('.png'):
                print file_count
                print file_name
                img = ndimage.imread(file_name, "grey")
                noise_reduction(img, file_name)
                file_count += 1
    # paths = np.loadtxt("./Doc/Specgram_path.txt", delimiter = "\n", dtype=np.str)
    # for filename in paths:
    #     file_name = filename.strip("wav")+"png"
    #     print file_name
    #     img = ndimage.imread(file_name, "grey")
    #     noise_reduction(img, file_name)


