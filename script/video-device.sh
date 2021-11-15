sudo apt-get install gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg

# After connecting usb
sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2
echo "dslr-webcam" >> /etc/modules

cat >> EOF /etc/modprobe.d/dslr-webcam.conf
# Module options for Video4Linux, needed for our DSLR Webcam
alias dslr-webcam v4l2loopback
options v4l2loopback exclusive_caps=1 max_buffers=2
EOF
