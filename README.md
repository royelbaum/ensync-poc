# ensync-poc

in order to run the poc you need to:
1. install minikube you can do it by run brew install minikube
2. run minikube start
3. go to dockers/calypso folder and run the command <br>
```docker build -t calypso-image .```
4. after finish building calypso image go to the dockers/sia and run <br>
```docker build -t mainapp-image .```
5. run the command
```minikube image load calypso-image```
6. run the command
```minikube image load mainapp-image```
7. go to kubernetes folder and run the command
```kubectl apply -f calypso_deployment.yaml```

this deployment will raise a pod with 2 container 1 is calypso container and 1 is the
demo the main app container.
next you can connect to calypso container by running: <br>
   1. ```kubectl get pod``` - copy the pod id <br>
   2. ```kubectl exec -it <POD_NAME> -c calypso -- /bin/bash``` <br>
   3. ```. /tmp/copyScript.sh /etc /var/tmp 30 calypso &``` <br>

in this container you will be able to see that its copying the files /etc/psswd and /etc/shadow to /var/tmp. <br>
afterward connect to the main-app container.
you can log to the main app container with the commands: <br>
    1. ```kubectl exec -it <POD_NAME> -- /bin/bash``` <br>
    2. ```. /tmp/copyScript.sh /var/tmp /etc 30 main-app &``` <br>
in the main container you will see that it's copying the passwd and shadow files from /var/tmp in etc

the other folders that calypso needs to share we can share them as mount folder to the same path

