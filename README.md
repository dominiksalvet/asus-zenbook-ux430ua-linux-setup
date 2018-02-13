# ASUS UX430UA Linux setup

The setup script customizes fan speed policy and 3.5mm jack output audio volume on ASUS UX430UA running Linux.

## Installation

To launch an installation wizard that will help you to get through the process, use the following command in a terminal:

```bash
sudo ./setup.sh
```

## Customize the fan speed policy

The used fan speed policy is defined by values assigned to the array variable `temps` at line 4 in a fan config file. The default fan speed policy looks like this:

```bash
# array of temperatures (in Celsius) per each fan speed level
temps=(55 60 62 65 68 72 76 80)
```

Table representation:

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

To customize the used fan speed policy, edit the line 4:

* directly in [`fan-config`](fan-config) file, if customizing **before** the installation
* in `/usr/local/bin/fan-config` file, if customizing **after** the installation

## License

This project is licensed under the MIT License, see the [`LICENSE.txt`](LICENSE.txt) file for details.
