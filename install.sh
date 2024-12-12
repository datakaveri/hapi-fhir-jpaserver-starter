kubectl create namespace fhir-resource
kubectl create configmap fhir-resource-env --from-env-file=secrets/.fhir-resource.env -n fhir-resource
kubectl create secret generic fhir-resource-config --from-file=secrets/config.json -n fhir-resource
helm install fhir-resource -f values.yaml -f resource-values.yaml ../hapi-fhir-jpaserver-starter/ $@ -n fhir-resource
