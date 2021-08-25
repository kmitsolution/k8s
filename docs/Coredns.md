# Coredns
CoreDNS is a flexible, extensible DNS server that can serve as the Kubernetes cluster DNS.CoreDNS is used by default.

### Coredns Pods
There are 2 pods running for coredns under kube-system namespace
```
kubectl get pods -n kube-system
```

### Coredns plugin information
Coredns pluging information is available in coredns file which is mapped to its config map.
```
kubectl get cm -n kube-system
kubectl describe cm coredns -n kube-system
```
### Coredns service
Coredns service is used for resolving the service discovery on the basis of name instead of IP address of service. kube-dns service is running in kube-system

```
kubectl get svc -n kube-system
```
cluster dns information can be found in cat /var/lib/kubelet/config.yaml

### Access the service with its name

#### Step 1 Create a service say nginx
```
 kubectl run nginx --image=nginx
 kubectl expose pod nginx --type=NodePort --port=80
```
#### Step 2 Add kube-dns service ip as nameserver in /etc/resolv.conf file
```
nameserver 10.96.0.10
search default.svc.cluster.local svc.cluster.local cluster.local
```
#### Step 3 Access the service with its name
```
host nginx
curl nginx

```
