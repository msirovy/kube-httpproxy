KUBERNETES HTTP REVERSE PROXY
=============================

proxy listen events from etcd and generate configuration of nginx


Kubernetes service example
--------------------------
apiVersion: v1
kind: Service
metadata:
  name: flaskapp1-svc
  namespace: george
  annotations:
    kubernetesReverseproxy: "{\"hosts\": [{\"host\": \"myflask1.example.com\", \"port\": \"80\"}]}"
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: my-flask-app1



Start
-----
docker run -d -p 80:80 -e ETCD_NODES="http://n1.iapp.eu:2379" nginx-kubeproxy
