# MAC Address Spoofer

Mac Address randomizer. Built for convenience purposes. Only supports MacOS.

**Note: It looks like Apple has decided that users cannot change their MAC address in Big Sur. This should still work for older MacOS versions.**

## Motivation

Using `macchanger` on Linux is a breeze. I wanted a similar experience for MacOS.

## Usage

You'll need to [install Crystal](https://crystal-lang.org/install/).

Build the binary:

```
crystal build spoof.cr
```

Then, run the binary while specifying the network interface whose MAC Address you want to randomize. This action requires elevated privileges, so you'll be asked for your password.
You can run `ifconfig` for a list of your interfaces and their associated MAC address.

```
./spoof -i en0
```

Example output:

```
Randomizing MAC address.
Password:

Done! New MAC address for en0: 35:3e:89:47:e7:5a
```
