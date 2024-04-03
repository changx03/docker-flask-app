# A tiny example for running a flask server in a docker container

## Create image

```bash
docker build -t luke/flask-app .
# -t Tag <tag_name>
```

## Run docker container

```bash
# Expose all ports
docker run -dP --name my-flask-app luke/flask-app
# -d Detach from terminal
# -P Publish-all ports (map to random ports)
# --name name-tag for the container (Must be unique!)

# To check ports
docker port my-flask-app

# Stop container
docker stop my-flask-app

# Map a port
docker -d -p <LOCAL_PORT>:<CONTAINER_PORT> --name my-flask-app luke/flask-app

# e.g.,
docker -d -p 8080:5000 --name my-flask-app luke/flask-app
# -p port (lower case for mapping 1 port. For multiple ports: e.g., -p 8080:5000 -p 8081:5001)

# Check containers
docker ps -a
# -a All, including exited containers

# Remove unused containers
docker container prune
```

## In `Dockerfile`

```Docker
FROM python:3.10

# If the WORKDIR doesn't exist, it will be created
WORKDIR /workspace/app

# Relative to WORKDIR
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# Default is TCP if you don't specify a protocol.
EXPOSE 5000/tcp
EXPOSE 5000/udp

# host must set, otherwise the server will NOT publicly available
CMD ["flask", "--app=app.py", "run", "--host=0.0.0.0", "--port=5000"]
```
