#https://www.v2ex.com/t/264280
http://video.stackexchange.com/questions/12905/repeat-loop-input-video-with-ffmpeg
# 循环推流 
#golf_680_640x360.mp4:loop=0 

#OR Add 
#-stream_loop -1 
#testing 
# At least on FFmpeg 2.8.x
ffmpeg -f lavfi -re -i movie=golf_680_640x360.mp4:loop=0 -acodec libfaac -b:a 64k -pix_fmt yuv420p -vcodec libx264 -x264opts level=41 -r 25 -profile:v baseline -b:v 1500k -maxrate 2000k -force_key_frames 50 -s 640×360 -map 0 -flags -global_header -f segment -segment_list index_1500.m3u8 -segment_time 10 -segment_format mpeg_ts -segment_list_type m3u8 segment%05d.ts 
# # At least on FFmpeg 2.8.x
ffmpeg -threads 2 -re -fflags +genpts -stream_loop -1 -i $F \ 
-s 640x360 -ac 2 -f flv -vcodec libx264 -profile:v baseline -b:v 600k -maxrate 600k -bufsize 600k -r 24 -ar 44100 -g 48 -c:a libfdk_aac -b:a 64k "rtmp://publish.live.metacdn.com/2050C7/dfsdfsd/lowquality_664?hello&adbe-live-event=lowquality_" \ 
-s 1920x1080 -ac 2 -f flv -vcodec libx264 -profile:v baseline -b:v 2000k -maxrate 2000k -bufsize 2000k -r 24 -ar 44100 -g 48 -c:a libfdk_aac -b:a 64k "rtmp://publish.live.metacdn.com/2050C7/dfsdfsd/highquality_2064?mate&adbe-live-event=highquality_"
# 循环推流第二章 : 上面的例子不够详细， 又从国外网站看到详细的方法
http://video.stackexchange.com/questions/12905/repeat-loop-input-video-with-ffmpeg
# 方法一，还未尝试


Make a text file. Contents of an example text file to repeat 4 times.

file 'input.mp4'
file 'input.mp4'
file 'input.mp4'
file 'input.mp4'
Then run ffmpeg:

ffmpeg -f concat -i list.txt -c copy output.mp4
For Linux users

#This example is the same as above but you don't have to manually make list.txt:

for i in {1..4}; do printf "file '%s'\n" input.mp4 >> list.txt; done
ffmpeg -f concat -i list.txt -c copy output.mp4
With most commonly-used modern shells, you can even avoid the creation of the list.txt file entirely. For example, with bash:

ffmpeg -f concat -i <(for i in {1..4}; do printf "file '%s'\n" input.mp4; done) -c copy output.mp4
-------------------------------------------------------------------------------------------
实验结果：成功了
for i in {1..4}; do printf "file '%s'\n" Kingkong.flv >> list.txt; done
ffmpeg -re -f concat  -i list.txt -vcodec copy -acodec copy  -f flv -y rtmp://127.0.0.1:19350/live/A0EF0795CE4646ACB0505FEA4A93080

# 方法二，比国内网站说得更清楚 
# -stream_loop 10000 ，可以运行但不管用,如下
ffmpeg -re -stream_loop 10000  -i /usr/local/srs/doc/Kingkong.flv -vcodec copy -acodec copy  -f flv -y rtmp://127.0.0.1:19350/live/A0EF0795CE4646ACB0505FEA4A93080
