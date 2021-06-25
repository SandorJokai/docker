<h1>HOW TO USE IT</h1>
make sure every files resides in the same directory
      
docker build -t "nameOfTheTag" .

# Now we're ready to run a container:
docker run -d --name "nameOfContainer" -p 80:80 -v ampache:/var/www/ampache ampache-stream

# If we want to be stateful our container, the volume comes to help. First I declared in the Dockerfile
# and also typed when I typed docker run command with a -v volumes. It'll be saved every datas in the
# container from /var/www/ampache directory.

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
