# OOM Bug Repro Steps

The following document bug appears to cause issues in GitHub Action pipelines
running `hurl` tests:

https://github.com/curl/curl/issues/8559

The OOM can be reproduced locally in an ubuntu container similar to the one
used by Actions.

The default configuration of Dockerfile.ubuntu is to use curl version 7.82,
with the documented issue. This is the same as specifying `--build-arg
curl_download=download/curl-7.82.0`. The tests will fail:

```
docker build -t hurl-oom-test -f docker/Dockerfile.ubuntu .
docker run -it hurl-oom-test ./ci/oom_test.sh
```

Use the `curl_download` build arg to switch to a recent snapshot of curl and
compare the passing tests:

```
docker build --build-arg curl_download=snapshots/curl-7.83.0-20220320 -t hurl-oom-test -f docker/Dockerfile.ubuntu .
docker run -it hurl-oom-test ./ci/oom_test.sh
```
