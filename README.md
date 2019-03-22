# docker-distroless-deno-example

> Run deno in distroless container

The result image size is `106MB`.

```console
$ docker build . -t deno
Sending build context to Docker daemon  40.45kB
Step 1/7 : FROM alpine:3.9.2
 ---> 5cb3aa00f899
Step 2/7 : RUN apk add --no-cache curl
 ---> Using cache
 ---> a3bf14f3efc4
Step 3/7 : RUN curl -L https://deno.land/x/install/install.sh | sh
 ---> Using cache
 ---> 908da5d0a19f
Step 4/7 : FROM gcr.io/distroless/cc
 ---> e2bb067a7cfa
Step 5/7 : COPY --from=0 /root/.deno/bin/deno /
 ---> Using cache
 ---> ab74cbb23ee6
Step 6/7 : COPY hello.ts /
 ---> Using cache
 ---> ccde535e5a37
Step 7/7 : ENTRYPOINT ["/deno", "hello.ts"]
 ---> Using cache
 ---> eb2dc39a9134
Successfully built eb2dc39a9134
Successfully tagged deno:latest
$ docker run deno
Compiling file:///hello.ts
hello
$ docker image ls deno --format "{{.Size}}"
106MB
```
