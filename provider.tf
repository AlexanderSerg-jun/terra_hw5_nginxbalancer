locals {
  cloud_id           = "b1gbhabnd2jbsnp8akhk"
  folder_id          = "b1g0khs670dnper1liqf" #otus-lab
  #folder_test_id     = "b1g69dmheko09a0asuq1" #test
  zone               = "ru-central1-b"
  token     = "y0_AgAAAABR39zNAATuwQAAAADwn1AxL86WvoLgSwydwS1qzGayNBlilgE"
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
