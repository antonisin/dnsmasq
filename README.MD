# DNSmasq docker project.
Docker project to start using dnsmasq on local machine. All definition and rules are stored using docker-compose file.

## Author
Maxim Antonisin
- [maxim.antonisin@gmail.com](mailto:maxim.antonisin@gmail.com)
- [Linkedin](https://www.linkedin.com/in/mantonishin/)

## Requirements 
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
By default, are added this domains:

| Domain    | IP        |     |
|-----------|-----------|-----|
| .test     | 127.0.0.1 |     |
| .local    | 127.0.0.1 |     |
| .loc      | 127.0.0.1 |     |
| localhost | 127.0.0.1 |     |
