variable "neon_org_id" {
  description = "Organization ID de Neon"
  type        = string
}

resource "neon_project" "radiodifusion" {
  name       = "radiodifusion-mtc"
  pg_version = 17
  org_id     = var.neon_org_id

  history_retention_seconds = 21600

  branch {
    name          = "main"
    database_name = "radiodifusion_db"
    role_name     = "radiodifusion_admin"
  }
}