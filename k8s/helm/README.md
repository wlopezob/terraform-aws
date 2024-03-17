# HELM

## install HELM
https://helm.sh/docs/intro/install/

# Create Chart HELM
helm create casino

## Depurar chart sin instalar 
helm install --debug --dry-run apirust ./casino

## Depurar chart e instalar
helm install --debug apirust ./casino


## empaquetar chart
helm package casino/
helm repo index .
## subir el index.yaml y el tgz a un servidor de archivos
## añadir repositorio, instalar e uninstall
helm repo add app https://mihelm01.blob.core.windows.net/helm/
helm show values app/casino # ver lista de variables
helm install --debug -f values.yaml apirust app/casino
helm uninstall --debug  apirust


