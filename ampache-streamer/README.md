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

<h1>How to use this</h1>
Just to make sure that every files resides in the same directory.
As step number 1, let's build an image from [Dockerfile](https://github.com/SandorJokai/docker/edit/master/ampache-streamer/Dockerfile):
      
Step 1 - *docker build -t "nameOfTheTag" .* <h6>using tags makes our life easier, trust me...</h6>

<h4>Now we're ready to run a container from that image:</h4>
Step 2 - *docker run -d --name "nameOfContainer" -p 80:80 -v ampache:/var/www/ampache ampache-stream*

*note: To make any data savings from running container, volumes comes to help. Just type "-v" option with the run command. It'll be saved every datas from the
container "/var/www/ampache" to host.*

# First thing I needed is to get an access into the running container:
docker exec -it "nameOfContainer" /bin/bash

# let's make the database more secure:
mysql_secure_installation ---> hit enter for first and then type y for the rest of the questions.

# let's get inside to create a user:
mysql -u root -p
create user 'ampache'@'localhost' identified by 'ampache';
grant all privileges on ampache.* to 'ampache'@'localhost';
flush privileges;
exit
exit

Let's see on browser's URL and follow the instructions to finish.
