#使用ffmpeg 向nginx-rtmp提供视频源
ffmpeg -re -i test4-flv-1191Kbps.flv -f flv rtmp://127.0.0.1/myapp
#解决 ffmpeg -re -i test13-flv-1797kbps.mkv  -f flv rtmp://127.0.0.1/myapp
# 出现的错误: [adpcm_swf @ 0x2a581a0] Sample rate must be 11025, 22050 or 44100
# ...
# Error while opening encoder for output stream #0:1 - maybe incorrect
# parameters such as bit_rate, rate, width or height
# 参考博客http://my.oschina.net/u/919580/blog/140858
ffmpeg -re -i test13-flv-1797kbps.mkv  -ar 44100 -f flv rtmp://127.0.0.1/myapp
# 提高质量的选项
ffmpeg -re -i test13-flv-1797kbps.mkv -qscale 0 -ar 44100 -f flv rtmp://127.0.0.1/myapp
