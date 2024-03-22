locals {
  cloud_id           = "b1gbhabnd2jbsnp8akhk"
  folder_id          = "b1g0khs670dnper1liqf" 
 
  zone               = "ru-central1-b"
  token     = ""
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
     
  }
}

provider "yandex" {
  cloud_id  = local.cloud_id
  folder_id = local.folder_id
  token = local.token

}
