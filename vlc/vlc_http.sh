# http://blog.csdn.net/gavinr/article/details/7287939 vlc流输出功能
#vlc 发送 http 流媒体 特点点播
vlc test11-mp4.mp4 -vvv --loop --sout "#standard{access=http,mux=asf,dst=192.168.100.109:10086/stream}"
# 客户端使用下列链接播放 : http://192.168.100.109:10086/stream
# 使用chrome浏览器可以下载http流数据
