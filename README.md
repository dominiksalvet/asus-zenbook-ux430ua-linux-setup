# ASUS ZenBook UX430UA Linux Setup

The setup script customizes fan speed policy and 3.5mm jack output audio volume on ASUS UX430UA running Linux.

## Software requirements

* using **systemd** as the init system

## Installation

To launch an installation wizard that will help you to get through the process, use the following command in a terminal opened in the *asus-zenbook-ux430ua-linux* directory:

```bash
sudo ./src/setup
```

Keep in mind that all original files from the *src* directory must be accessible while installing!

## Customize the fan speed policy

The fan speed policy is defined by values assigned to the array variable `temps` at line 4 in a fan config file. The default fan speed policy looks like this:

```bash
# array of temperatures (in Celsius) per each fan speed level
temps=(55 60 62 65 68 72 76 80)
```

Table equivalent:

| Speed level   | Temperature (C°) |
| ------------- | ---------------- |
| 0 (off)       | 55>              |
| 1             | 60               |
| 2             | 62               |
| 3             | 65               |
| 4             | 68               |
| 5             | 72               |
| 6             | 76               |
| 7             | 80<              |

To customize the fan speed policy, edit the line 4:

* directly in [*src/fan-config*](src/fan-config) file, if customizing **before** the installation
* in */usr/local/bin/fan-config* file, if customizing **after** the installation

Both cases requires reboot to apply the changes.

## License

This project is licensed under an Open Source Initiative approved license, the MIT License. See the [*LICENSE.txt*](LICENSE.txt) file for details.

<p align="center">
  <a href="http://opensource.org/">
    <img src="https://opensource.org/files/osi_logo_bold_300X400_90ppi.png" width="100">
  </a>
</p>
