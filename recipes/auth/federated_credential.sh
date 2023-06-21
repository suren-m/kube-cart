clusterName=""
clusterRG=""
 
az aks show -n $clusterName -g $clusterRG --query identity
# or
az identity show --ids $clusterIdentityFQRN -o tsv --query "clientId"

clusterIdentityName=$(echo ${$clusterIdentityFQRN##*/})

AKS_OIDC_ISSUER="$(az aks show -n $clusterName -g $clusterRG --query "oidcIssuerProfile.issuerUrl" -otsv)"

az identity federated-credential create --n "azenvAppIdFC" \
--identity-name $clusterIdentityName \
-g $resourceGroupName \ 
--issuer $AKS_OIDC_ISSUER \
--subject system:serviceaccount:myapps:appsa # ns:saName

# rg is user-mi identity's rg

# az identity federated-credential create --n "azenvAppIdFC" --identity-name $clusterIdentityName -g $resourceGroupName --issuer $AKS_OIDC_ISSUER --subject system:serviceaccount:myapps:appsa # ns:saName

az identity federated-credential list --identity-name $clusterIdentityName -g $resourceGroupName