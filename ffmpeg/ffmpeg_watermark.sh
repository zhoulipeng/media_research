# 用ffmpeg给watermark加水印
ffmpeg -y -i test11-flv-4710Kbps.flv -vf "movie=3562c895d143ad4b3d4367cd83025aafa40f061b.jpg [logo];[in][logo] overlay=10:10 [out]"  test11-flv-4710Kbps_watertag.flv
