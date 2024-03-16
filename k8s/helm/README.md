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
helm package appchart/
helm repo index .
## subir el index.yaml y el tgz a un servidor de archivos
## añadir repositorio, instalar e uninstall
helm repo add app https://pjfrusac.blob.core.windows.net/helm/
helm show values app/appchart # ver lista de variables
helm install --debug -f values.yaml app-config app/appchart
helm uninstall --debug  app-config