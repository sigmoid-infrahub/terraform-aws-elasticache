variable "cluster_id" {
  type        = string
  description = "ElastiCache cluster ID"
}

variable "engine" {
  type        = string
  description = "Cache engine"
}

variable "engine_version" {
  type        = string
  description = "Engine version"
  default     = null
}

variable "node_type" {
  type        = string
  description = "Node type"
}

variable "num_cache_nodes" {
  type        = number
  description = "Number of cache nodes"
  default     = 1
}

variable "subnet_group_name" {
  type        = string
  description = "Subnet group name"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
  default     = []
}

variable "parameter_group_name" {
  type        = string
  description = "Parameter group name"
  default     = null
}

variable "port" {
  type        = number
  description = "Port"
  default     = null
}

variable "automatic_failover_enabled" {
  type        = bool
  description = "Automatic failover"
  default     = false
}

variable "multi_az_enabled" {
  type        = bool
  description = "Multi-AZ enabled"
  default     = false
}

variable "snapshot_retention_limit" {
  type        = number
  description = "Snapshot retention limit"
  default     = 0
}

variable "snapshot_window" {
  type        = string
  description = "Snapshot window"
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = "Maintenance window"
  default     = null
}

variable "at_rest_encryption_enabled" {
  type        = bool
  description = "At-rest encryption enabled"
  default     = true
}

variable "transit_encryption_enabled" {
  type        = bool
  description = "Transit encryption enabled"
  default     = true
}

variable "auth_token" {
  type        = string
  description = "Auth token"
  sensitive   = true
  default     = null
}

variable "apply_immediately" {
  type        = bool
  description = "Apply immediately"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}
