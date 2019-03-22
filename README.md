# traefik-docker-demo
Docker compose traefik demo

## Architecture

Run and scale two web containers web1 and web2 with one traefik container.
Rewrite url for web1 and web1 with local domain :
- docker.local/web1
- docker.local/web2

## User guide

### 1. Configure

```bash
sudo echo "127.0.0.1       docker.local" > /etc/hosts
```

### 2. Run

```bash
./run.sh
```

### 3. Test

```bash
for i in $(seq 1 5); do { curl docker.local/web1; docker-compose logs traefik; } done
docker-compose logs -f traefik
```
