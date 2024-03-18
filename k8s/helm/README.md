# HELM

## install HELM
https://helm.sh/docs/intro/install/

# Create Chart HELM
helm create appchart

## Depurar chart sin instalar con valores por defecto
helm install --debug --dry-run apirust ./appchart

## Depurar chart sin instalar con archivo values
helm install --debug --dry-run  -f values-des.yaml app-database ./appchart

## Depurar chart e instalar
helm install --debug apirust ./appchart


## empaquetar chart
helm package appchart/
helm repo index .
## subir el index.yaml y el tgz a un servidor de archivos
## añadir repositorio, instalar e uninstall
helm repo add app https://mihelm01.blob.core.windows.net/helm/
helm show values app/appchart # ver lista de variables
helm install --debug -f values.yaml apirust app/appchart
helm uninstall --debug  apirust

helm repo remove app


