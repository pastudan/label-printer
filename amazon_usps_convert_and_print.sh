convert -crop 3400x2420+750+3740 -density 600x600 -quality 100 -rotate 90 $1 tmp.jpg
lpr -P dymo4x6 tmp.jpg
rm tmp.jpg
