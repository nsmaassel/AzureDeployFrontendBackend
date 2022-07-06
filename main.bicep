// Learn about bicep modules: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/modules

targetScope = 'subscription'

@minLength(3)
@maxLength(11)
param namePrefix string = ''

var resourceGroupName = 'OOA-${namePrefix}rg'

resource ooaRG 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: resourceGroupName
}

module frontendApp 'dotnetApp.bicep' = {
  name: 'ooa-frontend'
  scope: ooaRG
  params: {
      location: ooaRG.location
  }
}

module functionApp 'functionApp.bicep' = {
  name: 'ooa-functionApp'
  scope: ooaRG
  params: {
    location: ooaRG.location
    appInsightsLocation: ooaRG.location
  }
}
