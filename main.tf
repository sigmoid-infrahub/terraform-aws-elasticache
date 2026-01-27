resource "aws_elasticache_replication_group" "this" {
  replication_group_id = var.cluster_id
  description          = "sigmoid-redis"

  engine             = var.engine
  engine_version     = var.engine_version
  node_type          = var.node_type
  num_cache_clusters = var.num_cache_nodes

  subnet_group_name  = var.subnet_group_name
  security_group_ids = var.security_group_ids

  parameter_group_name       = var.parameter_group_name
  port                       = var.port
  automatic_failover_enabled = var.automatic_failover_enabled
  multi_az_enabled           = var.multi_az_enabled
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  maintenance_window         = var.maintenance_window

  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                 = var.auth_token

  apply_immediately = var.apply_immediately

  tags = local.resolved_tags
}

