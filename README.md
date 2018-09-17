**DEPRECATED - no longer maintained since 2018-07-21!**

The program itself has been split into[asus-fan-control](https://gitlab.com/dominiksalvet/asus-fan-control) and [ux430ua-jack-volume](https://gitlab.com/dominiksalvet/ux430ua-jack-volume) programs. These programs have been improved over time and they include a **new, smarter and easier installation manager**, [gim](https://gitlab.com/dominiksalvet/gim).

Before moving to these programs, uninstall all parts of [asus-zenbook-ux430ua-linux-setup](https://github.com/dominiksalvet/asus-zenbook-ux430ua-linux-setup) program using the embedded make uninstaller.

---

# ASUS ZenBook UX430UA Linux Setup

In a default setup of ASUS ZenBook UX430UA running Linux a fan is driven very aggressively. Even when the notebook is not under any load, the fan keeps running quite loudly. Also, output volume of 3.5 mm jack has a very low coefficient, so volume of 3.5 mm devices is scaled down significantly compared to what it should be.

Both described problems can be solved with this program. The program includes a simple installation wizard, where it is possible to choose which configurations apply. The installer also enables an installation by individual parts and so it can detect previously installed parts of the program and additionally install only the missing ones.

## Software requirements

* using **systemd** as the init system

## Installation

To start the installation, run the program by typing the following command in a terminal emulator opened in the downloaded *asus-zenbook-ux430ua-linux-setup* directory:

```bash
sudo make install
```

The program will asks for a sudo password, because it needs to write configuration files to a location that is unaccessible to a normal user account.

---

If it is required to uninstall the program, open a terminal emulator in the downloaded *asus-zenbook-ux430ua-linux-setup* directory and type:

```bash
sudo make uninstall
```

## Configuration

### Choose installation directory

The default installation directory is */usr/local/bin*. To change it, pass your choosed installation directory path in `INSTALL_DIR` to a `make` command. For example:

```bash
sudo make install INSTALL_DIR=/opt
```

In case of uninstalling from a custom installation directory, do not forget to use it as well.

### Customize the fan speed policy

The fan speed policy is defined by 8 numbers that represent temperature boundaries in Celsius between individual fan speed levels. Those numbers should be increasing as they increase the fan speed level.

The default values are `55 60 62 65 68 72 76 80`, their table representation follows:

| Speed level   | Temperatures (C°) |
| ------------- | ----------------- |
| 0 (off)       | 54 and less       |
| 1             | 55 to 59          |
| 2             | 60 to 61          |
| 3             | 62 to 64          |
| 4             | 65 to 67          |
| 5             | 68 to 71          |
| 6             | 72 to 75          |
| 7             | 76 to 79          |
| 8 (max)       | 80 and more       |

However, during the installation process you will be asked if you like to use your custom values. If so, you can directly type them into the program, which will throw your input againts a format check. Input with valid format consists of 8 not negative numbers separated by one space. Nevertheless, be aware that meaning of the entered numbers is not further checked though!

---

An example of correct using custom temperatures:

```
...
Installing ...
Default temperatures per each fan speed level: 55 60 62 65 68 72 76 80
Enter custom temperatures or hit enter to use the default ones.
> 45 50 55 60 65 70 75 80
...
```

## Thanks

The very core of this program stands on a comment from [afilipovich](https://github.com/afilipovich) user in [this issue](https://github.com/daringer/asus-fan/issues/44).

## License

This project is licensed under an Open Source Initiative approved license, the MIT License. See the [*LICENSE.txt*](LICENSE.txt) file for details. Individual files contain the SPDX license identifier instead of the full license text.

<p align="center">
  <a href="http://opensource.org/">
    <img src="https://opensource.org/files/osi_logo_bold_300X400_90ppi.png" width="100">
  </a>
</p>
