![npm package](https://img.shields.io/badge/docker-19.03.8-blue.svg)
![npm package](https://img.shields.io/badge/ampache-4.1.1-yellow.svg)
![npm package](https://img.shields.io/badge/apache-2.4.38-purple.svg)
![npm package](https://img.shields.io/badge/mariadb-10.3.29-yellow.svg)

<h1>About Docker</h1>

![Image of docker](https://github.com/SandorJokai/docker/blob/master/ampache-streamer/docker.png)

Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files, they can communicate with each other through well-defined channels.
This way of using can able to share any software installation without worrying about any dependencies or limitations.

<h1>Prerequisites</h1>

- docker engine must be installed
- be able to use some basic docker commands

<h1>What about this project</h1>

One one the most easiest and enjoyable way of working with containers is making micro-services.

*Microservice architecture – a variant of the service-oriented architecture (SOA) structural style – arranges an application as a collection of loosely-coupled services. In a microservices architecture, services are fine-grained and the protocols are lightweight. [wikipedia](https://en.wikipedia.org/wiki/Microservices)*

In this case we can build a music streamer provided by apache2 webserver and MariaDB RDBMS on a docker container.
      
<h1>How to use this</h1>
Just to make sure that every files resides in the same directory.
As step number 1, let's build an image from <a href="https://github.com/SandorJokai/docker/blob/master/ampache-streamer/Dockerfile" target="_blank">Dockerfile</a>:
      
<h3>Step 1</h3>

```bash
docker build -t "nameOfTheTag" .
```

<h6>using tags makes our life easier, trust me. "." in the end assumes Dockerfile resides in the same directory</h6>

<h4>Now we're ready to run a container from that image:</h4>

<h3>Step 2</h3>

```bash
docker run -d --name "nameOfContainer" -p 80:80 -v ampache:/var/www/ampache ampache-stream
```

<h6>*note: To make any data savings from running container, volumes comes to help. Just type "-v" option with the run command. It'll be saved every datas from the
container "/var/www/ampache" to host.*</h6>

<h4>Let's get inside the running container:</h4>

<h3>Step 3</h3>
```bash
docker exec -it "nameOfContainer" /bin/bash
```

<h6>Besides that we can use "docker inspect" command to get more info from the container</h6>


<h4>make the database more secure</h4>

<h3>Step 4</h3>

```bash
mysql_secure_installation
```
---> hit enter and then type "y" for rest of the questions.

<h2>Working with database</h2>

As we built some <a href="https://github.com/SandorJokai/docker/blob/master/ampache-streamer/credentials.txt" target="_blank">sql parameters</a> into the image, we do not need to do anything with it. We already have a database, a user and permissions to work with.

<h1>Final steps in browser</h1>

Let's open a browser with typing the IP_HOST and follow the instructions to finish.

- type the "ampache" to MySQL username and password
- take the tick out from create a database as we already have one in docker image
- finish the wizard and enjoy the music. :)

![image of ampache](https://github.com/SandorJokai/docker/blob/master/ampache-streamer/ampache.png)

![npm package](https://img.shields.io/badge/docker-19.03.8-blue.svg)
![npm package](https://img.shields.io/badge/ampache-4.1.1-yellow.svg)
![npm package](https://img.shields.io/badge/apache-2.4.38-purple.svg)
![npm package](https://img.shields.io/badge/mariadb-10.3.29-yellow.svg)
