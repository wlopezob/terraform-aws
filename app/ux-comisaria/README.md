# Prompts

- Crea un service llamado ComisariaServiceImpl
- Crea un ApplicationProperties que va cargar los valores de http-client del bootrap-local.yaml
- El ComisariaServiceImpl que va tener un metodo donde mediante WebClient se va conectar al app-database-v1 del ApplicationProperties y obtener un Flux del listado de ComisariaResponse


- Crea un controllador que consuma este service y devuelva el listado de comisarias



# DOCKER

## Build app-database
```
docker build -t wlopezob/ux-comisaria .
docker run --name cntuxcomisaria --network red-wlopezob -e HTTP_CLIENT_APP_DATABASE_V1_URL=http://cntappdatabase/app-database/v1 -e SPRING_PROFILES_ACTIVE=local -e SERVER_PORT=80 -p 8081:80  wlopezob/ux-comisaria
curl http://localhost:8081/ux-comisaria/v1/comisaria
```

## delete container
```
docker rm cntuxcomisaria -f
```