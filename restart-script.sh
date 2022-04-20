docker stop proj5-image
docker system prune -f

docker pull brettw1419/project5-repo:latest

docker run -d --name proj5-image --rm -p 80:80 brettw1419/project5-repo:latest
