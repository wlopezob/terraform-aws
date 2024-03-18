alias k=kubectl
alias kc=kubectl -n casino
k get tiporecurso # listar
k delete tiporecurso# para eliminar
k describe tiporecurso# para ver detalles

#node(no)
k get no

## connect to pod containe
kubectl -n comisaria exec -it pod/app-database-76dbdd6d5d-4tg6g -- /bin/bash
