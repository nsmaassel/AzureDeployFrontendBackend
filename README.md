# azure_deploy_frontend_backend

# Create bicep files with VS Code
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI

## ARM template deployment
Create resource group
az group create --name "Nick-sandbox-rg" --location "westus"

Create deployment group and deploy via ARM template
<!-- Resource Group deploy -->
az deployment sub create --name "NickSandboxDeployment" --resource-group "Nick-sandbox-rg" --template-file "./main.bicep"

<!-- Subscription deploy -->
<!--    Deploy everything at once -->
az deployment sub create --name "NickSandboxDeployment" --location "westus" --template-file "./main.bicep"
<!--    Deploy just the frontend -->
az deployment group create --name "NickFrontendDeployment" --resource-group Nick-sandbox-rg --template-file "./dotnetApp.bicep"
<!--    Deploy just the backend/function app -->
az deployment group create --name "NickFunctionAppDeployment" --resource-group Nick-sandbox-rg --template-file "./functionApp.bicep"
<!-- How to pass parameters to a bicep file: -->
  <!-- --parameters storageAccountType=Standard_GRS -->

## Teardown
<!-- Delete everything -->
az group delete --name "Nick-OOA-rg"