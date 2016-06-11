if [ -z "$1" ]; then
    echo "usage: print.sh provider_service.pdf [--dry]\n"
fi

regex="(amazon|paypal|direct)_(ups|usps|fedex)\.pdf"
[[ $1 =~ $regex ]]

provider="${BASH_REMATCH[1]}"
service="${BASH_REMATCH[2]}"

p_s="${provider}_${service}"

size=$3
case "$p_s" in
    amazon_fedex)
        size="3050x4000+0+0";;
    amazon_ups)
        size="3850x2590+640+2435";;
    amazon_usps)
        size="3400x2420+750+3740";;
    direct_ups)
        size="4200x2580+300+3440";;
    paypal_usps)
        size="3400x2420+900+440";;
esac

# -rotate -90
convert -crop "${size}" -density 600x600 -quality 100 $1 output.jpg

if [ "$2" != "--dry" ]; then
    lpr -P dymo4x6 output.jpg
    rm output.jpg
fi
