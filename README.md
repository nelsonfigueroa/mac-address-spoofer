# MAC Address Generator

Written using Ruby 2.6.3.
Only supports MacOS. If you need to spoof a MAC address on a linux OS, check out `macchanger`.

This script spoofs your MAC address to a randomized one. A handful of computer manufacturers can be specified in order to generate a MAC address based on that manufacturer. If a manufacturer is specified, the first 3 bytes will match the manufacturer's while the last 3 bytes will be randomized. If no manufacturer is specified, the entire 6 bytes of the MAC address will be randomized.

Only tested on MacOS and Ubuntu (Linux). Windows is not currently supported.

## Usage

*Note: You might need to run the script with elevated privileges*

```sh
ruby mac_generator.rb [interface] [manufacturer (optional)]
```

Current manufacturers available:
- Dell
- HP
- Apple
- Lenovo
- Asus
- Toshiba
- Acer

## Examples

Change the MAC address of the `en0` interface to a completely random one:

```sh
ruby mac_generator.rb en0
```

Change the MAC address of the `en0` interface to that of a Dell machine:

```sh
ruby mac_generator.rb en0 dell
```