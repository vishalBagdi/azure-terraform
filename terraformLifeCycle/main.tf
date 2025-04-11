resource "azurerm_resource_group" "example" {
 
  name     = "${var.environment}-resources"
  location =  var.location
  tags = {
    enviroment = var.environment
  }
  
}
// Using Count 
resource "azurerm_storage_account" "example" {
  # using count
  # count                    = length(var.storage_account_name)
  # name                     = var.storage_account_name[count.index]
  # using for_each
   for_each              = var.storage_account_name
  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
  lifecycle {
  create_before_destroy = true
  prevent_destroy = true
  # ignore_changes = [tags]
  precondition {
    condition = contains(var.allowed_locations, var.location)
    error_message = "Please enter a valid location"
  }
}
}
 
