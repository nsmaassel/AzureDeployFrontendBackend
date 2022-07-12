// Learn about bicep modules: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/modules

targetScope = 'subscription'

@description('Name for the resource group.')
param resourceGroupName string = 'Nick-sandbox-rg'

@description('Location for all resources.')
param resourceGroupLocation string = 'westus'

resource armAppRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

@description('The name of your Web Site.')
var siteName = 'armApp-${uniqueString(armAppRG.id)}'

module frontendApp 'dotnetApp.bicep' = {
  name: '${siteName}-frontend'
  scope: armAppRG
  // params: {
      // location: armAppRG.location
  // }
}

module functionApp 'functionApp.bicep' = {
  name: '${siteName}-functionApp'
  scope: armAppRG
  // params: {
    // location: armAppRG.location
    // appInsightsLocation: armAppRG.location
  // }
}
