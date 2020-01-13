# Kubernetes API Reference Docs

## Download api resources

```shell
./get-k8s-api.sh 1.17
```

## Run by any http server (e.g. [http-server](https://www.npmjs.com/package/http-server))

```shell
http-server ./kubernetes.io
```

## Run by docker

```shell
docker run -d -p 8080:80 ./kubernetes.io:/usr/share/nginx/html:ro nginx
```

## Run by docker with prebuild image

```shell
docker run -d -p 8080:80 lonwern/k8s-api-docs
```
