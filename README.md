# Sinatra HTTP API to store and retrieve files

## Requirements

- docker 18.03.0 or higher
- docker-compose 1.21.0 or higher
- ruby 2.2

## Steps

1. Clone repository
```bash
git clone git@github.com:suharshan/sinatra_file_api.git
```

2. Build, create and start the service
```bash
docker-compose up --build
```

3. Open new terminal, start usinng the API
```bash
$ curl http://localhost:9393/help

Upload file
-----------
curl -X POST -F "file=@sample.png" http://<server ip>:9393/files

Retirieve file
--------------
curl http://<server ip>:9393/files/sample.png

Delete file
-----------
curl -X DELETE http://<server ip>:9393/files/sample.png
```
