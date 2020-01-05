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
    template_params = {
        panel_width                 = 24 / 2
        dashboard_id                = random_id.dashboard.hex
        dashboard_name              = var.name
        containers                  = var.containers
        panel_height                = var.panel_height
        prometheus_job_name         = var.prometheus_job_name
        folder_id                   = var.folder_id
        show_load_avg               = var.show_load_avg
        nodes_prometheus_job_name   = var.prometheus_job_name_ecs_nodes
    }
}

output "slug" {
    value = grafana_dashboard.metrics.slug
}