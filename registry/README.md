https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/registry

# to install the registry 

kubectl -f apply rc.yml
kubectl apply -f rc.yml
kubectl apply -f svc.yml
kubectl apply -f ds.yml
kubectl get pods
kubectl get ds
kubectl get ds --all-namespaces
kubectl get svc --all-namespaces
kubectl get rc --all-namespaces


# to use the registry from any machine 
POD=$(kubectl get pods --namespace kube-system -l k8s-app=kube-registry-upstream \
-o template --template '{{range .items}}{{.metadata.name}} {{.status.phase}}{{"\n"}}{{end}}' \
| grep Running | head -1 | cut -f1 -d' ')

nohup kubectl port-forward --namespace kube-system $POD 5000:5000 &

