#!/bin/bash

# check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit
fi

# notice
echo
echo 'Notice:'
echo 'The last line of "/etc/rc.local" must be "exit 0"!'
echo 'Option 1) will install "alsa-tools" package.'
echo 'Option 2) will install "acpi-call-dkms" package.'
echo

# configuration setup
echo 'Setup:'
read -p '1) Increase jack output volume? ' -n 1 jack_config; echo
read -p '2) Configure fan speed policy? ' -n 1 fan_config; echo
echo

read -p 'Are you really sure to proceed? ' -n 1 user_agreed; echo
if [[ $user_agreed != [yY] ]]; then
    exit
fi
echo
echo '================================================================'
echo

# remove "exit 0" tail from /etc/rc.local file
if [[ $jack_config = [Yy] ]] || [[ $fan_config = [Yy] ]]; then
    sed -i '$d' /etc/rc.local
fi

# increase jack output volume
if [[ $jack_config = [yY] ]]; then
    apt install alsa-tools -y
    cp jack-config /usr/local/bin/
    echo '/usr/local/bin/jack-config' >> /etc/rc.local
    ln -s /usr/local/bin/jack-config /lib/systemd/system-sleep/jack-config
fi

# configure fan speed policy
if [[ $fan_config = [yY] ]]; then
    apt install acpi-call-dkms -y
    echo 'acpi_call' >> /etc/modules
    cp fan-config /usr/local/bin/
    echo '/usr/local/bin/fan-config' >> /etc/rc.local
    ln -s /usr/local/bin/fan-config /lib/systemd/system-sleep/fan-config
fi

# append "exit 0" tail to /etc/rc.local file
if [[ $jack_config = [Yy] ]] || [[ $fan_config = [Yy] ]]; then
    echo 'exit 0' >> /etc/rc.local
fi

# finished
echo
echo '================================================================'
echo
echo 'Done! In order to apply the changes, reboot your machine.'
