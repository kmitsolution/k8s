#!/bin/bash

echo "[TASK 1] Join node to Kubernetes Cluster"

apt install -qq -y sshpass >/dev/null 2>&1
sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no kmaster.example.com:/tmp/joincluster.sh /tmp/joincluster.sh 2>/dev/null
bash /tmp/joincluster.sh >/dev/null 2>&1
