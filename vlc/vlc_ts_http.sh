#http://blog.chinaunix.net/uid-26527046-id-4409467.html
#server vlc http ts
vlc test.ts --sout
    "#standard{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=http,dst=10.22.76.56:3940}"
    --sout-all --sout-keep --loop

#server vlc http ts + play
vlc test.ts --sout "#duplicate{dst=display,dst=standard{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=http,dst=10.22.76.56:3940}}"   --sout-all --sout-keep --loop
vlc test.ts --sout
"#transcode{vcodec=mp4v,acodec=mpga,vb=800,ab=128,deinterlace}:duplicate{dst=display,dst=standard{mux=ts{pid-video=100,pid-audio=101,pid-pmt=98},access=http,dst=10.22.76.56:3940}}"
--sout-all --sout-keep --loop

#client
vlc http://10.22.76.56:3940


