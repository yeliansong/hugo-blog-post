# -*- coding: utf-8 -*-
import sys
import glob
from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont


def watermark(post_name):
    if post_name == 'all':
        post_name = '*'
    dir_name = 'static/' + post_name + '/*'
    for files in glob.glob(dir_name):
        im = Image.open(files)
        if len(im.getbands()) < 3:
            im = im.convert('RGB')
            print(files)
        font = ImageFont.truetype('ariali.ttf', max(30, int(im.size[1] / 20)))
        draw = ImageDraw.Draw(im)
        watermark_text = u'@yeliansong'
        text_size_x, text_size_y = draw.textsize(watermark_text, font=font)
        draw.text((im.size[0] - text_size_x, im.size[1] - text_size_y), watermark_text, fill=(1, 1, 1, 50), font=font)
        im.save(files)


if __name__ == '__main__':
    if len(sys.argv) == 2:
        watermark(sys.argv[1])
    else:
        print('[usage] <input>')
