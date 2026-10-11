variable "sql_warehouse_lookup" {
  description = <<EOT
Map of sql_warehouse_lookup, attributes below
Optional:
    - auto_stop_mins
    - cluster_size
    - creator_name
    - data_source_id
    - enable_photon
    - enable_serverless_compute
    - instance_profile_arn
    - jdbc_url
    - max_num_clusters
    - min_num_clusters
    - name
    - num_active_sessions
    - num_clusters
    - spot_instance_policy
    - state
    - warehouse_type
    - channel (block):
        - dbsql_version (optional)
        - name (optional)
    - health (block):
        - details (optional)
        - failure_reason (optional, block):
            - code (optional)
            - parameters (optional)
            - type (optional)
        - message (optional)
        - status (optional)
        - summary (optional)
    - odbc_params (block):
        - hostname (optional)
        - path (optional)
        - port (optional)
        - protocol (optional)
    - provider_config (block):
        - workspace_id (optional)
    - tags (block):
        - custom_tags (optional, block):
            - key (optional)
            - value (optional)
EOT

  type = map(object({
    auto_stop_mins            = optional(number)
    cluster_size              = optional(string)
    creator_name              = optional(string)
    data_source_id            = optional(string)
    enable_photon             = optional(bool)
    enable_serverless_compute = optional(bool)
    instance_profile_arn      = optional(string)
    jdbc_url                  = optional(string)
    max_num_clusters          = optional(number)
    min_num_clusters          = optional(number)
    name                      = optional(string)
    num_active_sessions       = optional(number)
    num_clusters              = optional(number)
    spot_instance_policy      = optional(string)
    state                     = optional(string)
    warehouse_type            = optional(string)
    channel = optional(object({
      dbsql_version = optional(string)
      name          = optional(string)
    }))
    health = optional(object({
      details = optional(string)
      failure_reason = optional(object({
        code       = optional(string)
        parameters = optional(map(string))
        type       = optional(string)
      }))
      message = optional(string)
      status  = optional(string)
      summary = optional(string)
    }))
    odbc_params = optional(object({
      hostname = optional(string)
      path     = optional(string)
      port     = optional(number)
      protocol = optional(string)
    }))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    tags = optional(object({
      custom_tags = optional(list(object({
        key   = optional(string)
        value = optional(string)
      })))
    }))
  }))
}

