# Terraform grafana modules

## ECS monitoring 

There are two modules for monitor ECS tasks:

- CPU & Memory usage
- Network & Disk usage

## Variables

**grafana-ecs-tasks-dashboard**

- folder_id: id of the folder where the dashboard is created in
- name: dashboard name
- prometheus_job_name: The Prometheus job name for cAdvisor exporting container information
- prometheus_job_name_ecs_nodes: The Prometheus job name for ECS node exporter
- panel_height: single panel height
- show_memory_fail: If false memory fails column is skipped
- show_traffic: If false traffic info column is skipped
- containers: List of containers description
    - name: The container_label_com_amazonaws_ecs_container_name pattern
    - display_name: Name displayed in the dashboard
    - td_family: Task definition family
    - null_as_zero: If true, null values are shown as a zero



## Example of usage

```
provider "grafana" {
  url  = "http://grafana.shopfans.io/"
  # auth = "XXXXX" This parameter should be set via environment variable: GRAFANA_AUTH
}


resource "grafana_folder" "ecs" {
  title = "ECS"
}

module "grafana_ecs_services_aggregated_dashboard" {
  source = "modules/grafana-ecs-tasks-dashboard"

  folder_id                       = grafana_folder.ecs.id
  name                            = "ECS / Containers / Services / CPU & Memory"
  prometheus_job_name             = "prod_ecs_docker"
  prometheus_job_name_ecs_nodes   = "prod_ecs"
  panel_height                    = 9
  show_memory_fail                = true
  show_traffic                    = false

  containers                      = [
        { name = "application1_ecs_label",      display_name = "application1" },
        { name = "application2_ecs_label",      display_name = "application2" },
        { name = "scheduled_task1_ecs_label",   display_name = "scheduled_task1",   td_family = "prod-ecommerce",   null_as_zero = true },
        { name = "scheduled_tasl2_ecs_label",   display_name = "scheduled_task2",                                   null_as_zero = true },
  ]
}

module "grafana_ecs_tasks_io_dashboard" {
  source = "../../../../modules/monitoring/grafana-ecs-tasks-io-dashboard"

  folder_id                       = grafana_folder.ecs.id
  name                            = "ECS / Containers / Scheduled tasks / IO"
  prometheus_job_name             = "ecs_docker"
  prometheus_job_name_ecs_nodes   = "prod_ecs"
  panel_height                    = 9
  containers                      = [
        { name = "application1_ecs_label",      display_name = "application1" },
        { name = "application2_ecs_label",      display_name = "application2" },
        { name = "scheduled_task1_ecs_label",   display_name = "scheduled_task1",   td_family = "prod-ecommerce",   null_as_zero = true },
        { name = "scheduled_tasl2_ecs_label",   display_name = "scheduled_task2",                                   null_as_zero = true },
  ]
}
```

## Screenshots

### CPU & Memory

![Screenshot 1](/static/cpu-mem-1.png)
![Screenshot 1](/static/cpu-mem-2.png)

### Disk and network IO

![Screenshot 1](/static/io-1.png)
![Screenshot 1](/static/io-2.png)
