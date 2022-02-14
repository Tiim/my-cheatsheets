# Octoprint

## Setting up mjpg-streamer

* Clone [mjpg-streamer](https://github.com/jacksonliam/mjpg-streamer) to home directory
* `mv mjpg-streamer/mjpg-streamer-experimental . && rm -rf mjpg-streamer`
* Install as described in the [README.md](https://github.com/jacksonliam/mjpg-streamer/blob/master/README.md)
* The following command should start mjpg-streamer: `./mjpg_streamer -o "output_http.so -w ./www" -i "input_uvc.so -d /dev/video2"` 
  Try the different video devices to find the correct one: `ls /dev | grep video`

/home/tim/mjpg-streamer-experimental/run.sh
```sh
#!/bin/bash

./mjpg_streamer -o "output_http.so -w ./www -p 8080" -i "input_uvc.so -d /dev/video2
```
`chmod +x /home/tim/mjpg-streamer-experimental/run.sh`

/home/tim/mjpg-streamer-experimental/mjpg-streamer.service.sample
```toml
[Unit]
Description=Stream video from webcam
After=syslog.target
After=network.target

[Service]
Type=simple
User=tim
Group=tim
WorkingDirectory=/home/tim/mjpg-streamer-experimental
ExecStart=/home/tim/mjpg-streamer-experimental/run.sh
Restart=always
RestartSec=5
Environment=

[Install]
WantedBy=multi-user.target
```
* `sudo cp /home/tim/mjpg-streamer-experimental/mjpg-streamer.service.sample /lib/systemd/system/mjpg-streamer.service`
* `sudo systemctl enable mjpg-streamer.service`

```sh
# or remove it
$ sudo systemctl disable mjpg-streamer.service

# and start/stop it
$ sudo systemctl start mjpg-streamer.service
$ sudo systemctl stop mjpg-streamer.service
```

It should now be available on port 8080
