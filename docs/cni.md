# Container Network Interface (CNI)
<ul>
  <li>Specification to configure network interfaces in Liunx Containers</li>
  <li>Concerned with connecting (add) and disconnecting(delete) containers to the network</li>
  <li> It is network model with connectivity rules: </br>
POD <======> POD  means pod to pod communication</br>
NODE <=======> POD means Node to pod communication</br>
</li>
<li> CNI comes with networking plugins like BRIDGE, VLAN, IPVLAN,MACVLAN, DHCP, host-local </li>
<li> Third Party plugins like Calico, Weave network, flannel, NSX</li>
</ul>
### Why CNI
<ul>
  <li>Networking can be highly environment sepcific </li>
  <li> Different projects seeks to solve the networking challanges - with potential overlap </li>
  <li> Makes standards for common networking </li>
</ul>

### CNI in Kubernetes
<ul>
  <li>  /opt/cni/bin/ show all the supported cni pluggins executeables </li>
  <li>  ls /etc/cni/net.d/ shows which plugin is used </li>
  <li> cat /etc/cni/net.d/10-calico.conflist (if you are using calico plugin) gives more information about the plugin </li>
</ul>
