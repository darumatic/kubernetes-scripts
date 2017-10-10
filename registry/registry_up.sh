#!/bin/bash
set -x
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo "Is process running?"

ps cax | grep port-forward
if [ $? -eq 0 ]; then
  echo "Process is running."
else
  echo "Process is not running."
        POD=$(kubectl get pods --namespace kube-system -l k8s-app=kube-registry-upstream \
            -o template --template '{{range .items}}{{.metadata.name}} {{.status.phase}}{{"\n"}}{{end}}' \
            | grep Running | head -1 | cut -f1 -d' ')

        nohup kubectl port-forward --namespace kube-system $POD 5000:5000 &
fi

