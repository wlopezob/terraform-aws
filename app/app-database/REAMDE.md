# Prompts


- crear un entity del documento comisaria que tiene los siguientes campos:
  {
  _id: identity
  id_dpto: string,
  departamento: string,
  id_prov: string,
  provincia: string,
  id_dist: string,
  comisaria: string,
  }

- Crea ComisariaResponse con los mismos campos de ComisariaEntity que tenga getter, setter
- Crea un service llamado ComisariaService que tenga.
* un metodo para retorne un Flux del listado de ComisariaResponse
* el metodo se conecta a ComisariaRepository para obtener el listado de ComisariaEntity
* el listado de ComisariaEntity se convierte a un listado de ComisariaResponse usando mapstruct
* finalmente crear su clase implement
 

# DOCKER

### create network bridge
```
docker network create red-wlopezob
```
## Build app-database
```
docker build -t wlopezob/app-database .
docker run --name cntappdatabase --network red-wlopezob -e SPRING_PROFILES_ACTIVE=local -e SERVER_PORT=80 -p 8080:80  wlopezob/app-database
curl http://localhost:8080/app-database/v1/comisaria
```

## delete container
```
docker rm cntappdatabase
```
## base 64
```
echo -n "my-password" | base64
echo "bXktcGFzc3dvcmQ=" | base64 --decode
```
## PUSH
```
docker push wlopezob/app-database
```

## install with HELM and values.yaml
```
helm repo add app https://mihelm01.blob.core.windows.net/helm/
helm install --debug --dry-run -f values-des.yaml app-database  app/appchart
helm install --debug -f values-des.yaml app-database  app/appchart
helm uninstall --debug app-database
# remove repo
helm repo remove app
```
