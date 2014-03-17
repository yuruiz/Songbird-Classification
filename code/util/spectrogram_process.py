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

import matplotlib.cm as cm

from pylab import

def get_wav_info(wav_file):
    wav = wave.open(wav_file, 'r')
    frames = wav.readframes(-1)
    sound_info = pylab.fromstring(frames, 'Int16')
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
    pylab.title('spectrogram of %r' % os.path.basename(wav_file).strip('.WAV').strip('.wav'))
    pylab.specgram(sound_info, Fs=frame_rate, cmap=cm.Greys)

    Specgram_dir = Specgram_path + dir_path.strip('.') + '/'
    Specgram_file_name = Specgram_dir + os.path.basename(wav_file).strip('.WAV').strip('.wav')+'.png'

    if not os.path.exists(Specgram_dir):
        os.makedirs(Specgram_dir)
    pylab.savefig(Specgram_file_name)


if __name__ == '__main__':
    rootDir = './Evans OBrien CD/'
    pic_path = './Specgram/'
    list_dirs = os.walk(rootDir)
    for root, dirs, files in list_dirs:
        for f in files:
            file_name = os.path.join(root, f)
            # print file_name
            if file_name.endswith('WAV'):
                print file_name
                graph_spectrogram(file_name, pic_path, root)
    # wav_file = './AMRE93_1.wav'

