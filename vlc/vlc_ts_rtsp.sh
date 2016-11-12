#http://blog.chinaunix.net/uid-26527046-id-4409467.html
#server rtsp
vlc test.ts --sout "#rtp{sdp=rtsp://:8554/test1}"
#server vlc play + rtsp
vlc test.ts --sout "#duplicate{dst=display, dst=rtp{sdp=rtsp://:8554/test1}}"
vlc test.ts --sout "#transcode{vcodec=mp4v,acodec=mpga,vb=800,ab=128,deinterlace}:duplicate{dst=display,
    dst=rtp{sdp=rtsp://:8554/test1}}"

#client
vlc rtsp://10.22.76.56:8554/test1
