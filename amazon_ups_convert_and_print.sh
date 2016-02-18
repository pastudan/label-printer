convert -crop 3850x2590+640+2435 -density 600x600 -quality 100 -rotate 90 $1[0] tmp.jpg
lpr -P dymo4x6 tmp.jpg
rm tmp.jpg
