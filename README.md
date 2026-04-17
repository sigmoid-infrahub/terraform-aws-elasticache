# Module: ElastiCache

This module manages an Amazon ElastiCache replication group, supporting Redis engines with high availability and security features.

## Features
- ElastiCache Replication Group creation
- Automatic failover and Multi-AZ support
- Encryption at rest and in transit
- Security group and Subnet group integration
- Authentication token support
- Snapshot and Maintenance window configuration

## Usage
```hcl
module "elasticache" {
  source = "../../terraform-modules/terraform-aws-elasticache"

  cluster_id         = "my-redis-cluster"
  engine             = "redis"
  node_type          = "cache.t3.micro"
  subnet_group_name  = "my-cache-subnet-group"
}
```

## Inputs
| Name | Type | Default | Description |
|------|------|---------|-------------|
| `cluster_id` | `string` | n/a | ElastiCache cluster ID |
| `engine` | `string` | n/a | Cache engine |
| `engine_version` | `string` | `null` | Engine version |
| `node_type` | `string` | n/a | Node type |
| `num_cache_nodes` | `number` | `1` | Number of cache nodes |
| `subnet_group_name` | `string` | n/a | Subnet group name |
| `security_group_ids` | `list(string)` | `[]` | Security group IDs |
| `parameter_group_name` | `string` | `null` | Parameter group name |
| `port` | `number` | `null` | Port |
| `automatic_failover_enabled` | `bool` | `false` | Automatic failover |
| `multi_az_enabled` | `bool` | `false` | Multi-AZ enabled |
| `snapshot_retention_limit` | `number` | `0` | Snapshot retention limit |
| `snapshot_window` | `string` | `null` | Snapshot window |
| `maintenance_window` | `string` | `null` | Maintenance window |
| `at_rest_encryption_enabled` | `bool` | `true` | At-rest encryption enabled |
| `transit_encryption_enabled` | `bool` | `true` | Transit encryption enabled |
| `auth_token` | `string` | `null` | Auth token |
| `apply_immediately` | `bool` | `false` | Apply immediately |
| `tags` | `map(string)` | `{}` | Tags to apply |

## Outputs
| Name | Description |
|------|-------------|
| `cluster_id` | ElastiCache replication group ID |
| `primary_endpoint` | Primary endpoint address |
| `module` | Full module outputs |

## Environment Variables
None

## Notes
- `auth_token` is sensitive and should be managed securely.
- Transit encryption is recommended when using authentication tokens.
- Automatic failover requires `num_cache_nodes` to be greater than 1 (except for certain T2/T3 types).
