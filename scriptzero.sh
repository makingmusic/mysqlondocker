docker volume rm dbstore
docker system prune
docker volume create dbstore
git clone git@github.com:makingmusic/mysqlondocker.git
chmod 755 start_in_container.sh
docker build . -t merasqlimage
docker compose -f compose-merasql.yaml up --build

# script that will bring down the containers
#docker compose -f compose-merasql.yaml down

# script that will bring down the containers and remove the volumes
#docker compose -f compose-merasql.yaml down -v

# script that will bring down the containers and remove the volumes and images and networks and build
#docker compose -f compose-merasql.yaml down -v --rmi all --remove-orphans --build

# script that will bring down the containers and remove the volumes and images and networks and build 

