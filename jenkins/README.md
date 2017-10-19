helm install --name jenkins -f jenkins-values.yaml stable/jenkins


NOTES:
1. Get your 'admin' user password by running:
  printf $(kubectl get secret --namespace dev unsung-lemur-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  export NODE_PORT=$(kubectl get --namespace dev -o jsonpath="{.spec.ports[0].nodePort}" services unsung-lemur-jenkins)
  export NODE_IP=$(kubectl get nodes --namespace dev -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/login

3. Login with the password from step 1 and the username: admin


