# RabbitMQ Dockerfile

A Dockerfile that produces a Docker Image for [RabbitMQ](https://www.rabbitmq.com/).

## RabbitMQ version

The `master` branch currently hosts RabbitMQ 3.5.

Different versions of RabbitMQ are located at the github repo [branches](https://github.com/frodenas/docker-rabbitmq/branches).

## Usage

### Build the image

To create the image `frodenas/rabbitmq`, execute the following command on the `docker-rabbitmq` folder:

```
$ docker build -t frodenas/rabbitmq .
```

### Run the image

To run the image and bind to host port 5672:

```
$ docker run -d --name rabbitmq -p 5672:5672 frodenas/rabbitmq
```

If you want also to expose the RabbitMQ Management interface, you will need also to expose port 15672:

```
$ docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 frodenas/rabbitmq
```

The first time you run your container, a new user `rabbitmq` with all privileges will be created with a random password.
To get the password, check the logs of the container by running:

```
docker logs <CONTAINER_ID>
```

You will see an output like the following:

```
========================================================================
RabbitMQ User: "rabbitmq"
RabbitMQ Password: "8psfzXmp6t23rKr6"
RabbitMQ Virtual Host: "/"
========================================================================
```

#### Credentials

If you want to preset credentials instead of a random generated ones, you can set the following environment variables:

* `RABBITMQ_USERNAME` to set a specific username
* `RABBITMQ_PASSWORD` to set a specific password
* `RABBITMQ_VHOST` to set a specific Virtual Host

On this example we will preset our custom username and password:

```
$ docker run -d \
    --name rabbitmq \
    -p 5672:5672 \
    -e RABBITMQ_USERNAME=myusername \
    -e RABBITMQ_PASSWORD=mypassword \
    -e RABBITMQ_VHOST=myvhost \
    frodenas/rabbitmq
```

## Copyright

Copyright (c) 2014 Ferran Rodenas. See [LICENSE](https://github.com/frodenas/docker-rabbitmq/blob/master/LICENSE) for details.
