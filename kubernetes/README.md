# Kubernetes deployment files #

Deployment files are run each and every deployment.

If you add a new file you have to place the following line on deployment.sh file:

```
kubectl apply -f <file_name>
```

