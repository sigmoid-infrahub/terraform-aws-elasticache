output "cluster_id" {
  description = "ElastiCache replication group ID"
  value       = aws_elasticache_replication_group.this.id
}

output "primary_endpoint" {
  description = "Primary endpoint address"
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "subnet_group_name" {
  description = "Resolved subnet group name"
  value       = local.subnet_group_name
}

output "security_group_id" {
  description = "Created security group ID"
  value       = try(aws_security_group.this[0].id, null)
}

output "parameter_group_name" {
  description = "Resolved parameter group name"
  value       = local.parameter_group_name
}

output "module" {
  description = "Full module outputs"
  value = {
    cluster_id           = aws_elasticache_replication_group.this.id
    primary_endpoint     = aws_elasticache_replication_group.this.primary_endpoint_address
    subnet_group_name    = local.subnet_group_name
    security_group_id    = try(aws_security_group.this[0].id, null)
    parameter_group_name = local.parameter_group_name
  }
}
