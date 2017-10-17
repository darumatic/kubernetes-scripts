#Switch to the namespace where you want to create the ELK objects
#These commands will create ELK in the current namespace 

# install elastic search master
kubectl create -f es-discovery-svc.yaml
kubectl create -f es-svc.yaml
kubectl create -f es-master.yaml

(wait for masters to come up)

# install elastic search clients and workers
kubectl create -f es-client.yaml
kubectl create -f es-data.yaml


# install kibana:
kubectl create -f kibana-svc.yaml
kubectl create -f kibana.yaml

# install logstash (new method: seperate configmap for logstash.conf created from file)
kubectl create configmap logstash-pipeline --from-file=logstash.conf
kubectl create -f logbackups-pvc.yaml
kubectl create -f logstash-settings.yaml
kubectl create -f logstash.yaml
kubectl create -f logstash-svc.yaml

# install filebeat (internal to monitor cluster and pods)
kubectl create -f filebeat-config.yaml
kubectl create -f filebeat-ds.yaml



