resource "neon_project" "radiodifusion" {
  name       = "radiodifusion-mtc"
  pg_version = 17

  branch {
    name          = "main"
    database_name = "radiodifusion_db"
    role_name     = "radiodifusion_admin"
  }
}