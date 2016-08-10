#ffmpeg给视频加黑边功能
# http://blog.chinaunix.net/uid-26000296-id-4201971.html
# https://trac.ffmpeg.org/wiki/FilteringGuide
# https://ffmpeg.org/pipermail/ffmpeg-user/2012-October/010068.html how to add
# black borders on top and bottom to convert 16:9 video to 4:3 video
ffmpeg.exe -i D:\work\mediats\test9-mkv-3817Kbps.mkv -vf scale=1280:534,pad=1280:720:0:93:black -c:a copy -c:v libx264 D:\work\mediats\test9-mkv-3817Kbps1.mkv
