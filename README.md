API GATEWAY DEMO
================

This is an example of how to set up a test environment for an Nginx gateway, with tests
implemented using [pytest](https://docs.pytest.org/en/latest/).


Based on this post: [Lightweight Tests for your Nginx API Gateway](http://underthehood.meltwater.com/blog/2017/12/12/lightweight-tests-for-your-nginx-api-gateway/)

# Prerequisites
* [docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [Python 3.7](https://wiki.python.org/moin/BeginnersGuide/Download)

# Project structure explained
~~~bash
├── nginx (Gateway configuration)
│   ├── conf.d
│   │   └── api-gateway.conf (Location directives)
│   └── nginx.conf (Main config)
└── tests
    ├── nginx
    │   ├── conf.d
    │   │   └── services.conf (Internal services mock)
~~~

Setting up the test docker container required extra steps on top of the target Nginx setup:
* Use Docker DNS resolver
* Include self signed ssl certificate used in internal services mock


# Run tests
Set up testing environment:
~~~bash
$ make start
~~~

Execute tests:
~~~bash
$ make test
~~~

Reload [api-gateway.conf](nginx/conf.d/api-gateway.conf):
~~~bash
$ make reload
~~~

Stop:
~~~bash
$ make stop
~~~