# DNS update for INWX (resinOS Raspberry)

A Docker image that dynamicly updates DNS records hosted at [inxw](https://www.inwx.de/) with your current WAN address.
It uses the [nsupdate](https://github.com/chrisb86/nsupdate) shell script for this purpose.

## Requirements

A Raspberry PI that is running Linux and Docker (like using the [resinOS](https://resinos.io) image).

## Installation

Clone this repository and place your `.config` files into the `nsupdate.d` folder.
See the [here](https://github.com/chrisb86/nsupdate/blob/master/nsupdate.d/sample.config.dist) for an example.

```bash
$ git clone https://github.com/andban/rpi-docker-nsupdate
$ cd rpi-docker-nsupdate
```

Build the Docker image on the host:

```bash
$ docker build -t nsupdate .
$ docker run -d --restart=always --name nsupdate nsupdate
```

or using the resin-device-toolbox on your desktop:

```bash
$ rdt push --source .
```


## License

MIT
