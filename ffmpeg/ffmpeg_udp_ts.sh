#http://blog.csdn.net/vblittleboy/article/details/19478797 ffmpeg通过通过组播发送本地TS流文件 
ffmpeg -re -i /media/1.mpg -r 1800  -c copy -f mpegts udp://239.1.1.1:7000
#http://blog.csdn.net/glcdw/article/details/7258303 ffmpeg命令行接收UDP(MPEG-TS)数据 
ffmpeg -i udp://239.255.12.42:1234?multicast=1 
