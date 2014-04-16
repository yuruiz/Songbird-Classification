#!/usr/bin/env python
# Corey Goldberg 2013

"""Generate a Spectrogram image for a given WAV audio sample.

A spectrogram, or sonogram, is a visual representation of the spectrum
of frequencies in a sound.  Horizontal axis represents time, Vertical axis
represents frequency, and color represents amplitude.
"""


import os
import wave

import pylab

import cv2

import numpy as np

def get_wav_info(wav_file):
    wav = wave.open(wav_file, 'r')
    frames = wav.readframes(-1)
    sound_info = pylab.fromstring(frames, dtype=np.uint8)
    frame_rate = wav.getframerate()
    wav.close()
    return sound_info, frame_rate


def graph_spectrogram(wav_file, Specgram_path, dir_path):
    try:
        sound_info, frame_rate = get_wav_info(wav_file)
    except Exception as e:
        print e
        return

    pylab.figure(num=None, figsize=(19, 12))
    pylab.subplot(111)
    # pylab.title('spectrogram of %r' % os.path.basename(wav_file).strip('.WAV').strip('.wav'))
    pylab.specgram(sound_info, Fs=frame_rate, cmap=pylab.cm.Greys)
    pylab.axis('off')

    Specgram_dir = Specgram_path + dir_path.strip('.') + '/'
    Specgram_file_name = Specgram_dir + os.path.basename(wav_file)+'.png'

    if not os.path.exists(Specgram_dir):
        os.makedirs(Specgram_dir)
    pylab.savefig(Specgram_file_name)




if __name__ == '__main__':
    # rootDir = './SongBirdData/'
    pic_path = './Specgram/'
    # list_dirs = os.walk(rootDir)
    # for root, dirs, files in list_dirs:
    #     for f in files:
    #         file_name = os.path.join(root, f)
    #         # print file_name
    #         if file_name.endswith('wav'):
    #             print file_name

    # wav_file = './AMRE93_1.wav'
    paths = np.loadtxt("./Doc/WAV_path.txt", delimiter = "\n", dtype=np.str)

    file_count = 1
    for filename in paths:
        print file_count
        print filename
        root = filename.strip(os.path.basename(filename))
    # filename = "./SongBirdData/2010/YWAR_SY_M_235082993/YWAR_SY_M_235082993.(6).wav"
    # root = filename.strip(os.path.basename(filename))
        graph_spectrogram(filename, pic_path, root)
        file_count += 1
