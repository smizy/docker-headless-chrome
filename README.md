# docker-headless-chrome

```sh
$ docker build -t local/headless-chrome .
$ docker run -it --rm -v $(pwd):/code -w /code local/headless-chrome bash
> node demo.js
```