import numpy as np
from scipy import ndimage
from scipy import misc
import pylab as plt

from PIL import Image, ImageDraw, ImageOps

import matplotlib.cm as cm

def crop(img):
	original_length = img.shape[1]
	original_width  = img.shape[0]
	crop_length = 250
	top_crop_width  = 180
	bottom_crop_width = 120

	cropped_length = original_length - 2*crop_length
	cropped_width  = original_width - top_crop_width - bottom_crop_width

	cropped = np.zeros((cropped_width, cropped_length))

	for x in xrange(top_crop_width,img.shape[0] - bottom_crop_width):
		cropped[x - top_crop_width] = img[x][crop_length:(img.shape[1] - crop_length)]

	return cropped

def noise_reduction(img):
	colum_median = np.median(img, axis=0)
	row_median = np.median(img, axis=1)

	media_factor = 2

	for x in xrange(0, img.shape[0]):
		for y in xrange(0,img.shape[1]):
			if img[x][y] < colum_median[y]/media_factor and img[x][y] < row_median[x]/media_factor:
				img[x][y] = 255
			else:
				img[x][y] = 0

	misc.imsave("Median_clipped.png", img)
	toinvert = Image.open('Median_clipped.png')
	inverted = ImageOps.invert(toinvert)
	inverted.save("Median_clipped.png")


	eroded_img = ndimage.binary_erosion(img)
	reconstruct_img = ndimage.binary_propagation(eroded_img, mask=img)
	tmp = np.logical_not(reconstruct_img)
	eroded_tmp = ndimage.binary_erosion(tmp)
	reconstruct_final = np.logical_not(ndimage.binary_propagation(eroded_tmp, mask=tmp))

	misc.imsave("Eroded_and_propagated.png", reconstruct_final)
	toinvert = Image.open('Eroded_and_propagated.png')
	inverted = ImageOps.invert(toinvert)
	inverted.save("Eroded_and_propagated.png")

	labeled, num_features  = ndimage.measurements.label(reconstruct_final.astype(np.int))

	area = ndimage.measurements.sum(reconstruct_final, labeled, index=np.arange(1, labeled.max() + 1))

	valid_area_count = 0
	area_threshould = 500

	for x in xrange(0,num_features):
		if area[x] > area_threshould:
			valid_area_count += 1

	labels = ndimage.measurements.find_objects(labeled, max_label= num_features)

	# fig = plt.figure(figsize=(10, 4), dpi=100)

	cropped = Image.open("Cropped.png").convert('RGB')
	draw = ImageDraw.Draw(cropped)

	plot_count = 0
	for x in xrange(0, num_features):
		if plot_count == valid_area_count:
			break
		plt.subplot(1, valid_area_count, plot_count+1)
		if area[x] > area_threshould:
			(y_1, y_2, step_1) = labels[x][0].indices(reconstruct_final.shape[0])
			(x_1, x_2, step_2) = labels[x][1].indices(reconstruct_final.shape[1])
			draw.rectangle([x_1, y_1, x_2, y_2], outline = "yellow")
			# plt.imshow(reconstruct_final[labels[x]], cmap = cm.Greys)
			# plt.axis('off')
			plot_count += 1

	# plt.show()
	cropped.show()
	misc.imsave("labled.png", cropped)


if __name__ == '__main__':
	file_name = "sel.09.ch07.081108.161338.79.png"
	img = ndimage.imread(file_name, "grey")
	cropped_img = crop(img)
	misc.imsave("Cropped.png", cropped_img)
	noise_reduction(cropped_img)
	# np.savetxt("imgmatrix.txt", img, fmt = "%3d")


