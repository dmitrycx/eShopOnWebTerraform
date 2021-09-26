$SP_NAME = "sp-eShopOnWeb"
$SUBSCRIPTION_ID = az account show --query id --output tsv

# create service principle
az ad sp create-for-rbac `
    --name $SP_NAME `
    --role Contributor `
    --scopes /subscriptions/$SUBSCRIPTION_ID `
    --sdk-auth `

    # result will look like: 
    # {
    #     "clientId": "543fdb8d-3673-410a-a7e8-xxxxxxxxxxxx",
    #     "clientSecret": "NdNvys.sPeTVemE3lt6AHRxxxxxxxxxxxx",
    #     "subscriptionId": "b6a799d5-67cd-4e7e-a7e5-xxxxxxxxxxxx",
    #     "tenantId": "b41b72d0-4e9f-4c26-8a69-xxxxxxxxxxxx",
    #     "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
    #     "resourceManagerEndpointUrl": "https://management.azure.com/",
    #     "activeDirectoryGraphResourceId": "https://graph.windows.net/",
    #     "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
    #     "galleryEndpointUrl": "https://gallery.azure.com/",
    #     "managementEndpointUrl": "https://management.core.windows.net/"
    #   }   

    # These values map to the Terraform variables like so:
    # appId is the client_id defined above.
    # password is the client_secret defined above.
    # tenant is the tenant_id defined above.