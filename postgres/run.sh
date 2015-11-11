#Criação do volume Postgres:
docker run \
  -v /var/lib/postgresql/data \
  --name pg_data \
  -d postgres

#Cria o container do Postgres
docker run \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=123456 \
  --volumes-from pg_data \
  --name postgres \
  -d postgres:latest

#Cria o volume Tomcat:
docker run \
  -v /usr/local/tomcat/conf/ \
  --name tomcat_data \
  -d tomcat

#Cria o container Tomcat
docker run \
   -p 8888:8080 \
   --volumes-from tomcat_data \
   --name tomcat \
   -d tomcat



