output "cluster_id" {
  description = "ElastiCache replication group ID"
  value       = aws_elasticache_replication_group.this.id
}

output "primary_endpoint" {
  description = "Primary endpoint address"
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
}

output "module" {
  description = "Full module outputs"
  value = {
    cluster_id       = aws_elasticache_replication_group.this.id
    primary_endpoint = aws_elasticache_replication_group.this.primary_endpoint_address
  }
}
