# ASUS UX430UA linux setup

This setup basically customizes fan speed policy and 3.5mm jack output audio volume on Linux. Running the `sudo ./setup.sh` will launch an installation wizard that will help you to get through all the process.

## Customize the fan speed policy

The default fan speed policy is following:

| Level   | Temperature (C°) |
| ------- | ----------------:|
| 0 (off) |               55 |
| 1       |               60 |
| 2       |               62 |
| 3       |               65 |
| 4       |               68 |
| 5       |               72 |
| 6       |               76 |
| 7       |               80 |

The actual fan speed policy is defined by values assigned to the array variable `temps` at line 4 in a fan config file. To customize the actual fan speed policy:

* before the installation, you can directly modify the [`fan-config`](fan-config) file
* after the installation, you need to modify the `/usr/local/bin/fan-config` file

## License

This project is licensed under the MIT License, see the [`LICENSE.txt`](LICENSE.txt) file for details.
