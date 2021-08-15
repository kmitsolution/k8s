# ectd server
<ul></li>
  <li>etcd is a consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.</li>
  <li>etcd is an open source distributed key-value store used to hold and manage the critical information that distributed systems need to keep running.</li>
  <li>Kubernetes uses etcd to store all its data – its configuration data, its state, and its metadata.</li>
  <li>It stores the data in key value pair</li>
  </ul>  
  
  ### Access etcd data
  #### Prerequisite ( Install etcdctl )
  ```
     sudo apt -y install wget
     export RELEASE="3.3.13"
     wget https://github.com/etcd-io/etcd/releases/download/v${RELEASE}/etcd-v${RELEASE}-linux-amd64.tar.gz
     tar xvf etcd-v${RELEASE}-linux-amd64.tar.gz
     cd etcd-v${RELEASE}-linux-amd64
     sudo mv etcd etcdctl /usr/local/bin
     etcd --version
     etcdctl --version
  ```
  
  #### Step1:- check etcd pod description with following command
  ```
     kubectl describe pod etcd-kmaster -n kube-system
  ```
  Check the command property of etcd it contains all the information of the etcd server properties
  
  #### Step2:- Find all the keys in etcd server
  ```
  ETCDCTL_API=3 etcdctl --endpoints=https://172.31.8.197:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --key=/etc/kubernetes/pki/etcd/server.key --cert=/etc/kubernetes/pki/etcd/server.crt get / --prefix --keys-only
  ```
  
  #### Step3:- Put a key in etcd db
  ```
  ETCDCTL_API=3 etcdctl --endpoints=https://172.31.8.197:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --key=/etc/kubernetes/pki/etcd/server.key --cert=/etc/kubernetes/pki/etcd/server.crt put name raman
  ```
  
  #### Step4:- Get a key value from etcd server
  ```
  ETCDCTL_API=3 etcdctl --endpoints=https://172.31.8.197:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --key=/etc/kubernetes/pki/etcd/server.key --cert=/etc/kubernetes/pki/etcd/server.crt get name
  ```
  
  ## Backup and Restore etcd server
   𝐄𝐓𝐂𝐃 𝐁𝐚𝐜𝐤𝐮𝐩 & 𝐑𝐞𝐬𝐭𝐨𝐫𝐞

    We should use the ETCDCTL tool to interact with the ETCD cluster. Let’s look at the steps involved in the backup:

➥ Create a data snapshot
➥ Copy the snapshot to a PVC
➥ Restore the snapshot in a new cluster

And, that is exactly how we start creating a highly available cluster.

#### Backup etcd server
```
ETCDCTL_API=3 etcdctl snapshot save snapshot.db  --cacert=/etc/kubernetes/pki/etcd/ca.crt --key=/etc/kubernetes/pki/etcd/server.key --cert=/etc/kubernetes/pki/etcd/server.crt
Snapshot saved at snapshot.db

ETCDCTL_API=3 etcdctl --write-out=table snapshot status snapshot.db

  mkdir backup
  cd backup/
  cp -r /etc/kubernetes/pki .

```
#### Restore etcd server
```
--Reset the cluster
 kubeadm reset -f

---Copy the folder
cd backup
cp -r pki  /etc/kubernetes'
cd ..

ETCDCTL_API=3 etcdctl snapshot restore snapshot.db
mv default.etcd/member /var/lib/etcd/
```
