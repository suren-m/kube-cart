#https://argo-cd.readthedocs.io/en/stable/getting_started/
kubectl create namespace argocd
# HA
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:443

# https://argo-cd.readthedocs.io/en/stable/user-guide/private-repositories/
# https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token