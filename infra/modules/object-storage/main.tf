resource "yandex_storage_bucket" "this" {
  bucket = "static-files"
  acl    = "public-read"
  default_storage_class = "COLD"
}