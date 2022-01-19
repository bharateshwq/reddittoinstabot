from PIL import Image, ImageDraw, ImageFont
import sys,textwrap
    img = Image.open("/home/bharatesh/Documents/reddittoinstagram/simpleBot/discreteBot/grugewhite.jpg")
d =  ImageDraw.Draw(img)
textrender = sys.argv[1]
wrappedtext = textwrap.wrap(textrender,width=25)
font = ImageFont.truetype("fontface.ttf",size=70)
current_h,pad = 400,3
for line in wrappedtext:
    w, h = d.textsize(line,font=font)
    d.text(((1080-w)/2,current_h),line,font=font,fill="#000000")
    current_h+=h+pad
img.save("imagetest.jpg")
print ("created image")
