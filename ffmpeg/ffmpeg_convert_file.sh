# 文件转换功能， 解决了下列英文提示信息中错误的提示方法
# The encoder 'aac' is experimental but experimental codecs are not enabled, add
# '-strict -2' if you want to use it. 
ffmpeg -i test12-mkv-883kbps.mkv  -acodec aac  -strict -2 ffmpeg_outdir/test12-mkv-883kbps.mp4
