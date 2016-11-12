# http://blog.chinaunix.net/uid-26527046-id-4409467.html
# udp推送ts流
vlc  test.ts --sout "#standard{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=udp,dst=10.22.76.103:3940}"   --sout-all --sout-keep --loop
# 一边播放一边推送udp ts流 
vlc test.ts --sout "#duplicate{dst=display,dst=standard{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=udp,dst=172.22.102.56:3940}}"  --sout-all --sout-keep --loop

# 转码 + 播放 + 推送udp ts流
vlc test.ts --sout "#transcode{vcodec=mp4v,acodec=mpga,vb=800,ab=128,deinterlace}:duplicate{dst=display,dst=standard{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=udp,dst=172.22.102.56:3940}}" --sout-all --sout-keep --loop



