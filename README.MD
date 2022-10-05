# DNSmasq docker project.
Docker project to start using dnsmasq on local machine. All definition and rules are stored using docker-compose file.

## Author
Maxim Antonisin
- [maxim.antonisin@gmail.com](mailto:maxim.antonisin@gmail.com)
- [Linkedin](https://www.linkedin.com/in/mantonishin/)

## Requirements 
<a href="https://www.docker.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="40" height="40"/>

- docker.
- docker-compose (with 3.8 version compatibilities).
- open (non-used) 53 port

## Install
```shell
docker-compose build
```

## Run 
```shell
docker-compose up
```
or in background
```shell
docker-compose up -d
```

## Settings
All settings are stored in dnsmasq.conf file. On every change of this file u must restart container.
By default, are added these domains:

| Domain    | IP        |     |
|-----------|-----------|-----|
| .test     | 127.0.0.1 |     |
| .local    | 127.0.0.1 |     |
| .loc      | 127.0.0.1 |     |
| localhost | 127.0.0.1 |     |


## Support
<a href="https://www.buymeacoffee.com/sleepwalker"> <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="sleepwalker" style="margin-right: 12px;" /></a>
<a href="https://ko-fi.com/maximuscode"> <img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="maximuscode" /></a>
