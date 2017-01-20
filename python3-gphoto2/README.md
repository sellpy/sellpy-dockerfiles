This works but not if device is disconnected and reconnected
```docker run -i -t --device=/dev/bus/usb/  maxber/python3-gphoto2 /bin/bash```

This works, and reconnects devices, too much access to underlying system
```docker run -i -t -v /dev/bus/usb/:/dev/bus/usb --privileged   sellpy/python3-gphoto2 /bin/bash```

Seems gvfs-gphoto2-volume-monitor some how (if installed) locks up the camera when it connects.
Killing the process works but there shold be a way to ensure it does not boot or to kill it through docker
