Source: https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/registry

# to install the registry 

```
#install the Docker registry
kubectl apply -f rc.yml
kubectl apply -f svc.yml
kubectl apply -f ds.yml

#verify that all the resources were created and are active
kubectl get ds -n kube-system
kubectl get pods -n kube-system
```

# to use the registry from any machine 
```
POD=$(kubectl get pods --namespace kube-system -l k8s-app=kube-registry-upstream \
-o template --template '{{range .items}}{{.metadata.name}} {{.status.phase}}{{"\n"}}{{end}}' \
| grep Running | head -1 | cut -f1 -d' ')

nohup kubectl port-forward --namespace kube-system $POD 5000:5000 &
```

