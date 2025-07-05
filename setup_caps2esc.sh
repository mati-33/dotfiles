#!/bin/bash

if ! pacman -Qi interception-tools >/dev/null 2>$1; then
    yes | pacman -S interception-tools
fi

if ! pacman -Qi interception-caps2esc >/dev/null 2>&1; then
    yes | pacman -S interception-caps2esc
fi

if [ ! -f /etc/udevmon.yaml ]; then
    cat <<EOF >/etc/udevmon.yaml
- JOB: "intercept -g \$DEVNODE | caps2esc | uinput -d \$DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
EOF
    echo "file exists"
fi

if [ ! -f /etc/systemd/system/udevmon.service ]; then
    cat <<EOF >/etc/systemd/system/udevmon.service
[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target
EOF
fi

systemctl enable --now udevmon
