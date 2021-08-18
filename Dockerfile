FROM alpine:3.9.2
RUN apk add --no-cache curl
RUN curl -L https://deno.land/x/install/install.sh | sh
FROM gcr.io/distroless/cc
COPY --from=0 /root/.deno/bin/deno /
COPY hello.ts /
ENTRYPOINT ["/deno", "run", "hello.ts"]
