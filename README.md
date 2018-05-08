# ASUS ZenBook UX430UA Linux

In a default setup of ASUS ZenBook UX430UA running Linux a fan is driven very aggressively. Even when the notebook is not under any load, the fan keeps running quite loudly. Also, output volume of 3.5 mm jack has a very low coefficient, so volume of 3.5 mm devices is scaled down significantly compared to what it should be.

Both described problems can be solved with this program. The program includes a simple installation wizard, where it is possible to choose which configurations apply.

## Software requirements

* using **systemd** as the init system

## Installation

To start the installation, run the program by typing the following command in a terminal emulator opened in *asus-zenbook-ux430ua-linux* directory:

```bash
sudo make install
```

The program will asks for a sudo password, because it needs to write configuration files to a location that is unaccessible to a normal user account.

---

If it is required to uninstall the program, open a terminal emulator in *asus-zenbook-ux430ua-linux* directory and type:

```bash
sudo make uninstall
```

## Installation configuration

The default installation directory is */usr/local/bin*. To change it, pass your choosed installation directory path in `INSTALL_DIR` to a `make` command. For example:

```bash
sudo make install INSTALL_DIR=/opt
```

In case of uninstalling from a custom installation directory, do not forget to use it as well.

## Customize the fan speed policy

The fan speed policy must be stored statically in a source script to prevent accessing a file while running the script. Hence the fan speed policy is defined by values assigned to the array variable called `temps` in a *fan-config* file. A default fan speed policy looks like this:

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
| 7 (max)       | 80<              |

To customize the fan speed policy, edit the array assignment:

* directly in [*src/fan-config*](src/fan-config) file, if customizing **before** the installation
* in *INSTALL_DIR/fan-config* file, if customizing **after** the installation

Both cases require reboot to apply the changes!

## License

This project is licensed under an Open Source Initiative approved license, the MIT License. See the [*LICENSE.txt*](LICENSE.txt) file for details. Individual files contain the SPDX license identifier instead of the full license text.

<p align="center">
  <a href="http://opensource.org/">
    <img src="https://opensource.org/files/osi_logo_bold_300X400_90ppi.png" width="100">
  </a>
</p>
