# Installing Kubernetes Cluster (1 Master and 2 Worker Nodes) using Vagrant (Kubeadm installation)
<ul>
  <li>Step 1:- Download <a href="https://www.virtualbox.org/wiki/Downloads" > Virtual Box </a> and Install it on your OS </li>
  <li>Step 2:- Download <a href="https://www.vagrantup.com/downloads"> Vagrant </a> and Install it (It needs to ask for restart).</li>
  <li>Step 3:- Download <a href="https://git-scm.com/downloads"> Git </a> and Install it. </li>
  <li>Step 4:- Clone the git repo using command <br /> <i> git clone https://github.com/kmitsolution/k8s.git </i> </li>
  <li>Step 5:- Open Git Repo and Go to k8s/K8s-Vagrant/ on command terminal </li>
  <li>Step 6:- Install some vagrant plugins by running below command <br />
    vagrant plugin install vagrant-vbguest
  </li>
  <li>Step 7:- Run below command to create Kubernetes Cluster (It will take around 10-15 mins) <br />
    vagrant up </li>
  <li>Step 8:- Connect to Master server <br />
      vagrant ssh kmaster
  </li>
  <li>Step 9:- Verify the cluster is in ready State <br />
      kubectl get nodes
   </li> 
</ul>  
