## build

```bash
docker build -t registry.cn-hangzhou.aliyuncs.com/ahub/example-gin:v1.0 .
# docker build -t harbor.k8s/library/k8s-golang:v1.0 --build-arg GO_VERSION=1.19 .

docker run -p 8080:8080 registry.cn-hangzhou.aliyuncs.com/ahub/example-gin:v1.0
```

## push

```bash
docker login --username=hi********@aliyun.com registry.cn-hangzhou.aliyuncs.com
docker push registry.cn-hangzhou.aliyuncs.com/ahub/example-gin:v1.0
```

## deploy

```bash
$ kubectl -f k8s-gin
$ kubectl get svc
NAME               TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
gin-service        ClusterIP   10.103.254.157   <none>        8080/TCP       15m
$ curl 10.103.254.157:8080
{"message":"hello, world."}
```

