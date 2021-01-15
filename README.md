# formtools-on-docker
Docker installation of formtools

docker network create myapp
docker run -d --name db -e MYSQL_ROOT_PASSWORD=superpippo -e MYSQL_DATABASE=test -e MYSQL_USER=test -e MYSQL_PASSWORD=test --network myapp mariadb
docker run -d -p 8080:80 --name php73 -v /mnt/c/Users/nicolam/tests/formtools:/var/www/html --network myapp nikinname/php73
