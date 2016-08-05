# 近期准备用 vlc 发送rtsp 流 ， 复制windows 命令在xshell + centos 6执行的时候，
# 发现可以在xshell 字符界面， 输出字符模拟视频好画面的神奇事件 特意记录一下
vlc :sout=#rtp{sdp=rtsp://:554/myapp} :sout-keep test11-flv-4710Kbps.flv
