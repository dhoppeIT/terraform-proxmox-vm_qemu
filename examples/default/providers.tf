provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_user             = var.pm_user
  pm_password         = var.pm_password
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_otp              = var.pm_otp
  pm_tls_insecure     = var.pm_tls_insecure
  pm_parallel         = var.pm_parallel
  pm_log_enable       = var.pm_log_enable
  pm_log_levels       = var.pm_log_levels
  pm_log_file         = var.pm_log_file
  pm_timeout          = var.pm_timeout
  pm_debug            = var.pm_debug
  pm_proxy_server     = var.pm_proxy_server
}
