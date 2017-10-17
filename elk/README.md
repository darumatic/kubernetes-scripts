#Switch to the namespace where you want to apply the ELK objects
#These commands will apply ELK in the current namespace 

# install elastic search master
kubectl apply -f es-discovery-svc.yaml
kubectl apply -f es-svc.yaml
kubectl apply -f es-master.yaml

(wait for masters to come up)

# install elastic search clients and workers
kubectl apply -f es-client.yaml
kubectl apply -f es-data.yaml


# install kibana:
kubectl apply -f kibana-svc.yaml
kubectl apply -f kibana.yaml

# install logstash (new method: seperate configmap for logstash.conf applyd from file)
kubectl apply configmap logstash-pipeline --from-file=logstash.conf
kubectl apply -f logbackups-pvc.yaml
kubectl apply -f logstash-settings.yaml
kubectl apply -f logstash.yaml
kubectl apply -f logstash-svc.yaml

# install filebeat (internal to monitor cluster and pods)
kubectl apply -f filebeat-config.yaml
kubectl apply -f filebeat-ds.yaml



