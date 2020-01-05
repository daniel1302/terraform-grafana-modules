variable "name" {
    type        = string
    description = "Grafana Dashboard name"
}

variable "containers" {
    type        = list
    description = "List of monitored containers"
    default     = [
        {
            name        = "prod-shoporama-fpm"
            display     = "shoporama-fpm"
            expression  = "some expression"
        }
    ]
}

variable "prometheus_job_name" {
    type        = string
    description = "Prometheus Job name used to collect cAdvisor logs"
}

variable "prometheus_job_name_ecs_nodes" {
    type        = string
    description = "Prometheus Job name used to collect nodes logs"
}

variable "folder_id" {
    type        = number
    description = "Folder ID where the dashboard is created"
    default     = 0
}

variable "panel_height" {
    type        = number
    description = "Height of single panel"
    default     = 9
}

variable "table_treshold" {
    type        = number
    description = "Treshold to show containers which use too much memory"
    default     = 70
}

variable "show_table" {
    type        = bool
    description = "If false table is not showed"
    default     = true
}

variable "table_height" {
    type        = number
    description = "Height of highest memory usage table"
    default     = 15
}

variable "show_memory_fail" {
    type        = bool
    description = "If true memory fails showed"
    default     = false
}

variable "show_load_avg" {
    type        = bool
    description = "If false load_avg section is not showed"
    default     = true
}



variable "show_traffic" {
    type        = bool
    description = "If false traffic per container section is not showed"
    default     = true
}


# https://www.terraform.io/docs/configuration/functions/templatefile.html
resource "grafana_dashboard" "metrics" {
  folder      = var.folder_id
  config_json = templatefile("${path.module}/template.json.tpl", local.template_params)
}

resource "random_id" "dashboard" {
  byte_length = 8
}

locals {
    panels_per_row  = var.show_memory_fail && var.show_traffic ? 4 : var.show_memory_fail || var.show_traffic ? 3 : 2
    template_params = {
        panel_width                 = 24 / local.panels_per_row
        memory_fail                 = var.show_memory_fail
        show_table                  = var.show_table
        table_height                = var.table_height
        table_treshold              = var.table_treshold
        dashboard_id                = random_id.dashboard.hex
        dashboard_name              = var.name
        containers                  = var.containers
        panel_height                = var.panel_height
        prometheus_job_name         = var.prometheus_job_name
        folder_id                   = var.folder_id
        show_load_avg               = var.show_load_avg
        nodes_prometheus_job_name   = var.prometheus_job_name_ecs_nodes
        show_traffic                = var.show_traffic
    }
}

output "slug" {
    value = grafana_dashboard.metrics.slug
}