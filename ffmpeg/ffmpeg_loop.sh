#https://www.v2ex.com/t/264280
# 循环推流 
#golf_680_640x360.mp4:loop=0 

#OR Add 
#-stream_loop -1 
#testing 

ffmpeg -f lavfi -re -i movie=golf_680_640x360.mp4:loop=0 -acodec libfaac -b:a 64k -pix_fmt yuv420p -vcodec libx264 -x264opts level=41 -r 25 -profile:v baseline -b:v 1500k -maxrate 2000k -force_key_frames 50 -s 640×360 -map 0 -flags -global_header -f segment -segment_list index_1500.m3u8 -segment_time 10 -segment_format mpeg_ts -segment_list_type m3u8 segment%05d.ts 

ffmpeg -threads 2 -re -fflags +genpts -stream_loop -1 -i $F \ 
-s 640x360 -ac 2 -f flv -vcodec libx264 -profile:v baseline -b:v 600k -maxrate 600k -bufsize 600k -r 24 -ar 44100 -g 48 -c:a libfdk_aac -b:a 64k "rtmp://publish.live.metacdn.com/2050C7/dfsdfsd/lowquality_664?hello&adbe-live-event=lowquality_" \ 
-s 1920x1080 -ac 2 -f flv -vcodec libx264 -profile:v baseline -b:v 2000k -maxrate 2000k -bufsize 2000k -r 24 -ar 44100 -g 48 -c:a libfdk_aac -b:a 64k "rtmp://publish.live.metacdn.com/2050C7/dfsdfsd/highquality_2064?mate&adbe-live-event=highquality_"
