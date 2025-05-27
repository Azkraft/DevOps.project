resource "yandex_storage_bucket" "this" {
  bucket = "azanov-files"
  acl    = "public-read"
}