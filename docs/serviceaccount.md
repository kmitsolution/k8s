# Service Accounts
Kubernetes service accounts allow processes in pods to connect and authenticate to the  API Server.

### Create a service account called appsa
#### Create a file called sa.yaml
```
apiVersion: v1
kind: ServiceAccount
metadata:
     name: appsa

```
#### Run below command to create service account
```
kubectl apply -f sa.yaml
```

#### Verify details about service account
```
  kubectl get sa
  kubectl get secrets
  kubectl describe secrets <<secret token >>
```
#### Create a deployment using a service account (deploy.yaml)

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
  labels:
    app: nginx-app
spec:
  replicas: 8
  template:
    metadata:
      labels:
        app: nginx-app
    spec:
      **serviceAccountName: appsa**
      containers:
      - name: nginx-container
        image: nginx:1.7.9
        ports:
        - containerPort: 80
  selector:
    matchLabels:
      app: nginx-app

```
### Run below command to apply deployment changes.
```
 kubectl apply -f deploy.yaml
```

### Verify Deployment get created successfully
```
kubectl get deploy
```

