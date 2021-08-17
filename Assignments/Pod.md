## Try This

#### Consideration:- You have 3 nodes ( 1 master and 2 worker nodes) Cluster. 
1. Create a Pod called nginx-pod1 with image nginx (it runs on Port 80)
2. Create another Pod called tomcat-pod1 with image tomcat (it runs on Port 8080)
3. Access these pods on worker nodes (use curl command ). Are you able to Access ? If not then checkout the reason.
4. Go inside tomcat pod ( use kubectl exec ....command) and try to access nginx service Pod by using nginx-pod1 IP address and podname. Are you able to access the nginx website ? if no then figureout the reason.
5. Go inside nginx pod (use kubectl exec ....command) and try to access tomcat service with IP address and podname ot tomcat-pod1. Are you able to access the nginx website ? if no then figureout the reason.
6. Change docker image of nginx-pod1 from nginx to tomcat. Is it possible for running pod?
7. Check the restart value of nginx-pod1.
8. check all the events of tomcat-pod1 and also find out in which namespace tomcat-pod1 is created.
9. Display the tomcat-pod1 properties in json format.
10. Delete all the pods.

