#!/bin/bash
kubectl delete -f jfrog-automation-portal.yml
kubectl delete -f jfrog-automation-workshop.yml

kubectl delete -k "github.com/eduk8s/eduk8s?ref=21.05.10.1"
