# DNSmasq Docker Project

Lightweight DNS server running in Docker for local development. Resolves custom domain TLDs (like `.test`, `.loc`) to `127.0.0.1` so you can use readable URLs instead of `localhost` during development — no need to edit `/etc/hosts`.

## Author

Maxim Antonisin
- [maxim.antonisin@gmail.com](mailto:maxim.antonisin@gmail.com)
- [LinkedIn](https://www.linkedin.com/in/mantonishin/)

## Requirements

- [Docker](https://www.docker.com/) with Compose (v3.8+ compatible)
- Port 53 available (not used by another process)

## Install

1. Create the external Docker network (required, one-time setup):
```shell
docker network create proxy
```

2. Build the image:
```shell
docker compose build
```

## Run

```shell
docker compose up
```

Or in the background:

```shell
docker compose up -d
```

> The container is configured with `restart: always`, so it will start automatically on boot.

## Stop

```shell
docker compose down
```

## DNS Resolver Setup (macOS)

The container runs dnsmasq on port 53, but your OS won't use it unless you configure it as a DNS resolver. On macOS, create a resolver file for each TLD:

```shell
sudo mkdir -p /etc/resolver

echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/test
echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/loc
echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/local
```

Verify it works:

```shell
scutil --dns    # should list your resolver entries
ping myapp.test # should resolve to 127.0.0.1
```

To undo, simply delete the resolver files:

```shell
sudo rm /etc/resolver/test /etc/resolver/loc /etc/resolver/local
```

## Settings

All DNS rules are defined in `dnsmasq.conf`. After any change, restart the container:

```shell
docker compose restart
```

### Default Domains

| Domain    | IP        |
|-----------|-----------|
| .test     | 127.0.0.1 |
| .local    | 127.0.0.1 |
| .loc      | 127.0.0.1 |
| localhost | 127.0.0.1 |

> **Note:** `.local` is reserved for mDNS (Bonjour/Avahi) and may conflict with macOS network discovery. If you experience issues, consider removing it and using `.loc` or `.test` instead.

### Adding a New Domain

Edit `dnsmasq.conf` and add a line following this pattern:

```
address=/.<tld>/127.0.0.1
```

For example, to add `.dev`:

```
address=/.dev/127.0.0.1
```

Then restart the container and (on macOS) create the matching resolver file:

```shell
docker compose restart
echo "nameserver 127.0.0.1" | sudo tee /etc/resolver/dev
```

## Troubleshooting

### Port 53 already in use

**macOS** — mDNSResponder or another service may hold port 53. Check with:

```shell
sudo lsof -i :53
```

**Linux** — `systemd-resolved` commonly occupies port 53. Disable it:

```shell
sudo systemctl disable --now systemd-resolved
```

Or change its configuration to free up port 53.

## License

This project is licensed under the [Apache License 2.0](LICENSE).

## Support

<a href="https://www.buymeacoffee.com/sleepwalker"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="Buy me a coffee" /></a>&nbsp;
<a href="https://ko-fi.com/maximuscode"><img src="https://cdn.ko-fi.com/cdn/kofi3.png?v=3" height="50" width="210" alt="Ko-fi" /></a>
