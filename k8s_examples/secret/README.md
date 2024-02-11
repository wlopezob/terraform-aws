kubectl -n casino create secret generic secret-db --from-literal=password=admin1234

### decodificar
kc  get secret secret-db  -o jsonpath="{.data.password}" | base64 --decode