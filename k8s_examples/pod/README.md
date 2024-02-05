# crear un pod
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80

k create -f pod01.yml
k apply -f pod01.yml
k delete -f pod01.yml
k logs mipod
k get po -n casino