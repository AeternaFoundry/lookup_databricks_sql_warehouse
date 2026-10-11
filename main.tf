data "databricks_sql_warehouse" "sql_warehouse_lookup" {
  for_each = var.sql_warehouse_lookup

  auto_stop_mins            = each.value.auto_stop_mins
  cluster_size              = each.value.cluster_size
  creator_name              = each.value.creator_name
  data_source_id            = each.value.data_source_id
  enable_photon             = each.value.enable_photon
  enable_serverless_compute = each.value.enable_serverless_compute
  instance_profile_arn      = each.value.instance_profile_arn
  jdbc_url                  = each.value.jdbc_url
  max_num_clusters          = each.value.max_num_clusters
  min_num_clusters          = each.value.min_num_clusters
  name                      = each.value.name
  num_active_sessions       = each.value.num_active_sessions
  num_clusters              = each.value.num_clusters
  spot_instance_policy      = each.value.spot_instance_policy
  state                     = each.value.state
  warehouse_type            = each.value.warehouse_type

  dynamic "channel" {
    for_each = each.value.channel != null ? [each.value.channel] : []
    content {
      dbsql_version = channel.value.dbsql_version
      name          = channel.value.name
    }
  }

  dynamic "health" {
    for_each = each.value.health != null ? [each.value.health] : []
    content {
      details = health.value.details
      dynamic "failure_reason" {
        for_each = health.value.failure_reason != null ? [health.value.failure_reason] : []
        content {
          code       = failure_reason.value.code
          parameters = failure_reason.value.parameters
          type       = failure_reason.value.type
        }
      }
      message = health.value.message
      status  = health.value.status
      summary = health.value.summary
    }
  }

  dynamic "odbc_params" {
    for_each = each.value.odbc_params != null ? [each.value.odbc_params] : []
    content {
      hostname = odbc_params.value.hostname
      path     = odbc_params.value.path
      port     = odbc_params.value.port
      protocol = odbc_params.value.protocol
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? [each.value.tags] : []
    content {
      dynamic "custom_tags" {
        for_each = tags.value.custom_tags != null ? tags.value.custom_tags : []
        content {
          key   = custom_tags.value.key
          value = custom_tags.value.value
        }
      }
    }
  }
}

