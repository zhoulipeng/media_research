#使用ffmpeg 向nginx-rtmp提供视频源
ffmpeg -re -i test4-flv-1191Kbps.flv -f flv rtmp://127.0.0.1/myapp
