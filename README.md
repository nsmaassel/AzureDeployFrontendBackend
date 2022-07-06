# azure_deploy_frontend_backend

# Create bicep files with VS Code
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI

## ARM template deployment
Create resource group
`az group create --name "NickRG" --location "westus"`

Create deployment group and deploy via ARM template
`az deployment group create --name "NickDeployment" --resource-group "NickRG" --template-file "./main.bicep"`

## Teardown
Delete everything
`az group delete --name "NickRG"`