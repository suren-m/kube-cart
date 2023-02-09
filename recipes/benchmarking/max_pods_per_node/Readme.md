

helm install -f tenant1.yml stateful-web ./stateful-web --namespace=tenant1 --create-namespace --dry-run

helm install -f tenant2.yml stateful-web ./stateful-web --namespace=tenant2 --create-namespace --dry-run

helm status stateful-web -n tenant1

helm ls --all-namespaces

helm ls stateful-web -n tenant1

helm upgrade -f ./stateful-web/values.yaml --set frontend.replicas=1 ./stateful-web --namespace=tenant1 --create-namespace --dry-run

helm upgrade -f ./stateful-web/values.yaml --set frontend.replicas=1 stateful-web ./stateful-web --namespace=tenant1 --create-namespace

# Values.yaml = Default. Overrides per env if needed
helm upgrade -f ./stateful-web/values.yaml ./tenant1.yaml ./stateful-web --namespace=tenant1 --create-namespace --dry-run

More Commands: https://helm.sh/docs/helm/helm_upgrade/