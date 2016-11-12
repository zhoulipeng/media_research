#http://blog.chinaunix.net/uid-26527046-id-4409467.html
#vlc rtp
vlc test.ts --sout
"#rtp{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},dst=172.22.102.55,port=3940}"
--sout-all --sout-keep --loop
vlc test.ts --sout "#rtp{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=udp,dst=172.22.102.55,port=3940}" --sout-all --sout-keep --loop
# vlc play + rtp


vlc test.ts --sout "#duplicate{dst=display,dst=rtp{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},dst=10.22.76.55,port=3940}}"
    --sout-all --sout-keep --loop
vlc test.ts --sout   "#transcode{vcodec=mp4v,acodec=mpga,vb=800,ab=128,deinterlace}:duplicate{dst=display,
    dst=rtp{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},dst=10.22.76.55,port=3940}}"
    --sout-all --sout-keep --loop



