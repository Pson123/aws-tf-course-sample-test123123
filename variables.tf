

variable "vpc_config" {
  description = "Contains the VPC configuration"
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The cidr_block config option must contain a valid CIDR block."
  }
}

# variable "vpc_cidr" {
#   type = string

#   validation {
#     condition     = can(cidrnetmask(var.vpc_cidr))
#     error_message = "The vpc_cidr must contain a valid CIDR block."
#   }
# }

# variable "vpc_name" {
#   type = string
# }

variable "subnet_config" {
  description = <<EOT
  Accepts a map of subnet configuration.

  cidr_block: The CIDR block
  public    : Whether subnet public or private
  az        : THe availability zone where to deploy the subnet
  EOT
  
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
    az         = string
  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The cidr_block config option must contain a valid CIDR block."
  }
}