# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}
 
# Configure the New Relic provider
provider "newrelic" {
  account_id = 4438260
  api_key = "NRAK-KKRZTZCW4HDS60KT0VI8L18BGH6"    # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}