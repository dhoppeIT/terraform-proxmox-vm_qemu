variable "pm_api_url" {
  type        = string
  description = "This is the target Proxmox API endpoint"
}

variable "pm_user" {
  type        = string
  default     = null
  description = "The user, remember to include the authentication realm such as myuser@pam or myuser@pve"
}

variable "pm_password" {
  type        = string
  sensitive   = true
  default     = null
  description = "The password"
}

variable "pm_api_token_id" {
  type        = string
  default     = null
  description = "This is an API token you have previously created for a specific user"
}

variable "pm_api_token_secret" {
  type        = string
  sensitive   = true
  default     = null
  description = "This uuid is only available when the token was initially created"
}

variable "pm_otp" {
  type        = string
  default     = null
  description = "The 2FA OTP code"
}

variable "pm_tls_insecure" {
  type        = bool
  default     = false
  description = "Disable TLS verification while connecting to the proxmox server"
}

variable "pm_parallel" {
  type        = number
  default     = 1
  description = "Allowed simultaneous Proxmox processes"
}

variable "pm_log_enable" {
  type        = bool
  default     = false
  description = "Enable debug logging, see the section below for logging details"
}

variable "pm_log_levels" {
  type        = map(string)
  default     = {}
  description = "A map of log sources and levels"
}

variable "pm_log_file" {
  type        = string
  default     = "terraform-plugin-proxmox.log"
  description = "The log file the provider will write logs to"
}

variable "pm_timeout" {
  type        = number
  default     = 300
  description = "Timeout value (seconds) for proxmox API calls"
}

variable "pm_debug" {
  type        = bool
  default     = false
  description = "Enable verbose output in proxmox-api-go"
}

variable "pm_proxy_server" {
  type        = string
  default     = null
  description = "Send provider api call to a proxy server for easy debugging"
}
