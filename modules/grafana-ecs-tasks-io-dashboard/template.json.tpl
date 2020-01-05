{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "id": 3,
  "links": [],
  "panels": [
      %{ if show_load_avg == true}

            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": null,
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": ${panel_height},
                "w": 8,
                "x": 0,
                "y": 0
              },
              "hiddenSeries": false,
              "id": 4,
              "legend": {
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "nullPointMode": "null",
              "options": {
                "dataLinks": []
              },
              "percentage": false,
              "pointradius": 2,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "expr": "node_load1{job=\"${nodes_prometheus_job_name}\", instance=~\"$node\"}*100",
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeFrom": null,
              "timeRegions": [],
              "timeShift": null,
              "title": "load1 history",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "buckets": null,
                "mode": "time",
                "name": null,
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "percent",
                  "label": "load1",
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                },
                {
                  "format": "short",
                  "label": null,
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false,
                "alignLevel": null
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": null,
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": ${panel_height},
                "w": 8,
                "x": 8,
                "y": 0
              },
              "hiddenSeries": false,
              "id": 6,
              "legend": {
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "nullPointMode": "null",
              "options": {
                "dataLinks": []
              },
              "percentage": false,
              "pointradius": 2,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "expr": "node_load5{job=\"${nodes_prometheus_job_name}\", instance=~\"$node\"}*100",
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeFrom": null,
              "timeRegions": [],
              "timeShift": null,
              "title": "load5 history",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "buckets": null,
                "mode": "time",
                "name": null,
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "percent",
                  "label": "load5",
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                },
                {
                  "format": "short",
                  "label": null,
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false,
                "alignLevel": null
              }
            },
            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": null,
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": ${panel_height},
                "w": 8,
                "x": 16,
                "y": 0
              },
              "hiddenSeries": false,
              "id": 8,
              "legend": {
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "nullPointMode": "null",
              "options": {
                "dataLinks": []
              },
              "percentage": false,
              "pointradius": 2,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "expr": "node_load5{job=\"${nodes_prometheus_job_name}\", instance=~\"$node\"}*100",
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeFrom": null,
              "timeRegions": [],
              "timeShift": null,
              "title": "load15 history",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "buckets": null,
                "mode": "time",
                "name": null,
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "percent",
                  "label": "load15",
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                },
                {
                  "format": "short",
                  "label": null,
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false,
                "alignLevel": null
              }
            },



    %{ endif }




    %{ for index, container in containers ~}

            %{ if index  > 0}
            ,
            %{ endif }


            {
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": null,
              "fill": 1,
              "fillGradient": 0,
              "gridPos": {
                "h": ${panel_height},
                "w": ${panel_width},
                "x": 0,
                "y": ${panel_height * (1 + index)}
              },
              "hiddenSeries": false,
              "id": ${115 + index},
              "legend": {
                "avg": false,
                "current": false,
                "max": false,
                "min": false,
                "show": true,
                "total": false,
                "values": false
              },
              "lines": true,
              "linewidth": 1,
              "nullPointMode": "null as zero",
              "options": {
                "dataLinks": []
              },
              "percentage": false,
              "pointradius": 2,
              "points": false,
              "renderer": "flot",
              "seriesOverrides": [
                {
                  "alias": "/(.*)-transmit/",
                  "transform": "negative-Y"
                }
              ],
              "spaceLength": 10,
              "stack": false,
              "steppedLine": false,
              "targets": [
                {
                  "expr": "sum by(instance, container_label_com_amazonaws_ecs_container_name) (rate(container_network_receive_bytes_total{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[30s]))",
                  "legendFormat": "{{instance}}-receive",
                  "refId": "A"
                },
                {
                  "expr": "sum by(instance, container_label_com_amazonaws_ecs_container_name) (rate(container_network_transmit_bytes_total{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[30s]))",
                  "legendFormat": "{{instance}}-transmit",
                  "refId": "B"
                }
              ],
              "thresholds": [],
              "timeFrom": null,
              "timeRegions": [],
              "timeShift": null,
              "title": "${container.display_name} traffic",
              "tooltip": {
                "shared": true,
                "sort": 0,
                "value_type": "individual"
              },
              "type": "graph",
              "xaxis": {
                "buckets": null,
                "mode": "time",
                "name": null,
                "show": true,
                "values": []
              },
              "yaxes": [
                {
                  "format": "Bps",
                  "label": null,
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                },
                {
                  "format": "short",
                  "label": null,
                  "logBase": 1,
                  "max": null,
                  "min": null,
                  "show": true
                }
              ],
              "yaxis": {
                "align": false,
                "alignLevel": null
              }
            },

            {
              "datasource": null,
              "type": "graph",
              "title": "${container.display_name} disk IO",
              "gridPos": {
                "x": ${panel_width},
                "y": ${panel_height * (1 + index)},
                "w": ${panel_width},
                "h": ${panel_height}
              },
              "id": ${215 + index},
              "targets": [
                {
                  "refId": "A",
                  "expr": "sum by(instance, container_label_com_amazonaws_ecs_container_name) (rate(container_fs_reads_bytes_total{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[30s])) ",
                  "legendFormat": "{{instance}}-read-bytes"
                },
                {
                  "refId": "B",
                  "expr": "sum by(instance, container_label_com_amazonaws_ecs_container_name) (rate(container_fs_writes_bytes_total{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[30s])) ",
                  "legendFormat": "{{instance}}-written-bytes"
                }
              ],
              "options": {
                "dataLinks": []
              },
              "renderer": "flot",
              "yaxes": [
                {
                  "label": "Written | Read",
                  "show": true,
                  "logBase": 1,
                  "min": null,
                  "max": null,
                  "format": "Bps"
                },
                {
                  "label": null,
                  "show": true,
                  "logBase": 1,
                  "min": null,
                  "max": null,
                  "format": "short"
                }
              ],
              "xaxis": {
                "show": true,
                "mode": "time",
                "name": null,
                "values": [],
                "buckets": null
              },
              "yaxis": {
                "align": false,
                "alignLevel": null
              },
              "lines": true,
              "fill": 1,
              "fillGradient": 1,
              "linewidth": 1,
              "dashes": false,
              "hiddenSeries": false,
              "dashLength": 10,
              "spaceLength": 10,
              "points": false,
              "pointradius": 2,
              "bars": false,
              "stack": false,
              "percentage": false,
              "legend": {
                "show": true,
                "values": false,
                "min": false,
                "max": false,
                "current": false,
                "total": false,
                "avg": false
              },
              "nullPointMode": "null as zero",
              "steppedLine": false,
              "tooltip": {
                "value_type": "individual",
                "shared": true,
                "sort": 0
              },
              "timeFrom": null,
              "timeShift": null,
              "aliasColors": {},
              "seriesOverrides": [
                {
                  "alias": "/.+-written-bytes/",
                  "transform": "negative-Y"
                }
              ],
              "thresholds": [],
              "timeRegions": []
            }



    %{ endfor ~}


  ],
  "refresh": false,
  "schemaVersion": 21,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {
          "selected": false,
          "text": "All",
          "value": "$__all"
        },
        "datasource": "Prometheus",
        "definition": "label_values(node_uname_info{}, instance)",
        "hide": 0,
        "includeAll": true,
        "label": "Instance",
        "multi": true,
        "name": "node",
        "options": [],
        "query": "label_values(node_uname_info{}, instance)",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-3h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ]
  },
  "timezone": "",
  "title": "${dashboard_name}",
  "uid": "${dashboard_id}",
  "version": 26
}