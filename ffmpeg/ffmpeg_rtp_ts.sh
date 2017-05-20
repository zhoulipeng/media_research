ffmpeg -re -i /root/zhoulp/140726yuko_480p.mp4 -vcodec copy -acodec copy -f rtp_mpegts udp://192.168.8.15:19381>test.sdp
