resource "aws_elasticache_subnet_group" "this" {
  count = var.create_subnet_group ? 1 : 0

  name       = coalesce(var.subnet_group_name, "${var.cluster_id}-subnet-group")
  subnet_ids = var.subnet_ids

  tags = local.resolved_tags
}

resource "aws_elasticache_parameter_group" "this" {
  count = var.create_parameter_group ? 1 : 0

  name   = coalesce(var.parameter_group_name, "${var.cluster_id}-parameter-group")
  family = var.parameter_group_family

  dynamic "parameter" {
    for_each = var.parameter_group_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0

  name        = "${var.cluster_id}-elasticache-sg"
  description = "Security group for ElastiCache ${var.cluster_id}"
  vpc_id      = var.vpc_id

  ingress {
    description = "ElastiCache ingress"
    from_port   = var.engine == "redis" ? 6379 : 11211
    to_port     = var.engine == "redis" ? 6379 : 11211
    protocol    = "tcp"
    cidr_blocks = var.security_group_ingress_cidr_blocks
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.resolved_tags
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id = var.cluster_id
  description          = "sigmoid-redis"

  engine             = var.engine
  engine_version     = var.engine_version
  node_type          = var.node_type
  num_cache_clusters = var.num_cache_nodes

  subnet_group_name  = local.subnet_group_name
  security_group_ids = local.security_group_ids

  parameter_group_name       = local.parameter_group_name
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
