@description('Name of the storage account.')
param storageAccountName string = 'st${uniqueString(resourceGroup().id)}'

@description('Deployment location.')
param location string = resourceGroup().location

module storage './modules/storage.bicep' = {
  name: 'storageModule'
  params: {
    storageAccountName: storageAccountName
    location: location
  }
}

output storageAccountId string = storage.outputs.storageAccountId

