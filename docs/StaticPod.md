# Static Pods

Static Pods are managed directly by the kubelet daemon on a specific node, without the API server observing them. Unlike Pods that are managed by the control plane (for example, a Deployment); instead, the kubelet watches each static Pod (and restarts it if it fails).

Static Pods are always bound to one Kubelet on a specific node.

The kubelet automatically tries to create a mirror Pod on the Kubernetes API server for each static Pod. This means that the Pods running on a node are visible on the API server, but cannot be controlled from there. The Pod names will suffixed with the node hostname with a leading hyphen

## Example

### Step1 :- Create a pod on a worker node (say node2) under /etc/kubernetes/manifest dir
```
  cd /etc/kubernetes/manifests/
  # Create a yaml file with below definition ( it is just an example)
    apiVersion: v1
    kind: Pod
    metadata:
     name: pod1
    spec:
      containers:
      - name: c1
        image: nginx

```

### Step2 :- Goto master Server and check the status of pod
```
 kubectl get pods -o wide
```
