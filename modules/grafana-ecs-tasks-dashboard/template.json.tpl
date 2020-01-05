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
    %{ if show_table == true}
      
            {
              "columns": [
                {
                  "text": "Current",
                  "value": "current"
                },
                {
                  "text": "Avg",
                  "value": "avg"
                }
              ],
              "datasource": null,
              "fontSize": "100%",
              "gridPos": {
                "h": ${table_height},
                "w": 24,
                "x": 0,
                "y": 0
              },
              "id": 12,
              "options": {},
              "pageSize": 100,
              "pluginVersion": "6.5.2",
              "showHeader": true,
              "sort": {
                "col": 0,
                "desc": true
              },
              "styles": [
                {
                  "alias": "Time",
                  "dateFormat": "YYYY-MM-DD HH:mm:ss",
                  "link": false,
                  "pattern": "Time",
                  "type": "date"
                },
                {
                  "alias": "",
                  "colorMode": "row",
                  "colors": [
                    "#37872D",
                    "#56A64B",
                    "#FFB357"
                  ],
                  "decimals": 2,
                  "pattern": "/.*/",
                  "thresholds": [
                    "60",
                    "80"
                  ],
                  "type": "number",
                  "unit": "short"
                }
              ],
              "targets": [
                {
                  "expr": "(max by(instance, container_label_com_amazonaws_ecs_task_definition_family) ((container_memory_usage_bytes{job=\"${prometheus_job_name}\", container_label_com_amazonaws_ecs_container_name!=\"\", image!=\"amazon/amazon-ecs-pause:0.1.0\", instance=~\"$node\"}) / container_spec_memory_limit_bytes{job=\"ecs_docker\", container_label_com_amazonaws_ecs_container_name!=\"\", instance=~\"$node\"})* 100) > ${table_treshold}",
                  "format": "time_series",
                  "legendFormat": "{{instance}}-{{container_label_com_amazonaws_ecs_task_definition_family}}",
                  "refId": "A"
                }
              ],
              "timeFrom": null,
              "timeShift": null,
              "title": "highest memory utilization by containers [% of container quota]",
              "transform": "timeseries_aggregations",
              "type": "table"
            },



    %{ endif }


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
              "fillGradient": 1,
              "gridPos": {
                "h": ${panel_height},
                "w": ${panel_width},
                "x": 0,
                "y": ${table_height + (panel_height * (1 + index))}
              },
              "hiddenSeries": false,
              "id": ${15 + index},
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
              "nullPointMode": "%{ if lookup(container, "null_as_zero", "") == "" }null%{ else }null as zero%{ endif }",
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
                  "expr": "sum by(instance, container_label_com_amazonaws_ecs_container_name) (container_memory_usage_bytes{job=\"${prometheus_job_name}\", container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"})",
                  "legendFormat": "{{instance}}-{{container_label_com_amazonaws_ecs_container_name}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeFrom": null,
              "timeRegions": [],
              "timeShift": null,
              "title": "${container.display_name} memory utilization",
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
                  "format": "bytes",
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
              "aliasColors": {},
              "bars": false,
              "dashLength": 10,
              "dashes": false,
              "datasource": null,
              "fill": 1,
              "fillGradient": 1,
              "gridPos": {
                "h": ${panel_height},
                "w": ${panel_width},
                "x": ${panel_width},
                "y": ${table_height + (panel_height * (1 + index))}
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
              "nullPointMode": "%{ if lookup(container, "null_as_zero", "") == "" }null%{ else }null as zero%{ endif }",
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
                  "expr": "avg  by (instance) (sum by (instance, name) (rate(container_cpu_usage_seconds_total{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[60s]) * 1024 * 60) / on (instance, name) (container_spec_cpu_shares{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}) / 60 * 100)",
                  "legendFormat": "{{instance}}",
                  "refId": "A"
                }
              ],
              "thresholds": [],
              "timeFrom": null,
              "timeRegions": [],
              "timeShift": null,
              "title": "${container.display_name} cpu usage [% of cpu quota]",
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
                  "format": "short",
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
            }




            %{ if memory_fail == true }

                    ,
                    {
                      "aliasColors": {},
                      "bars": false,
                      "dashLength": 10,
                      "dashes": false,
                      "datasource": null,
                      "fill": 1,
                      "fillGradient": 1,
                      "gridPos": {
                        "h": ${panel_height},
                        "w": ${panel_width},
                        "x": ${ 2 * panel_width},
                        "y": ${table_height + (panel_height * (1 + index))}
                      },
                      "hiddenSeries": false,
                      "id": ${215 + index},
                      "legend": {
                        "alignAsTable": true,
                        "avg": true,
                        "current": true,
                        "max": true,
                        "min": true,
                        "show": true,
                        "total": false,
                        "values": true
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
                          "expr": "sum(rate(container_memory_failcnt{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[5m]))",
                          "legendFormat": "Number of memory usage hits limits",
                          "refId": "A"
                        },
                        {
                          "expr": "sum(rate(container_memory_failures_total{container_label_com_amazonaws_ecs_container_name=\"${container.name}\"%{ if lookup(container, "td_family", "") != "" }, container_label_com_amazonaws_ecs_task_definition_family=~\".*${container.td_family}.*\"%{ endif }, instance=~\"$node\"}[5m]))",
                          "legendFormat": "Cumulative count of memory allocation failures.",
                          "refId": "B"
                        }
                      ],
                      "thresholds": [],
                      "timeFrom": null,
                      "timeRegions": [],
                      "timeShift": null,
                      "title": "${container.display_name} memory failures",
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
                          "format": "short",
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
                    }

            %{ endif }



            %{ if show_traffic == true}


                    ,
                    {
                      "Dupa": "DUPA",
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
                        "x": %{ if memory_fail == true } ${ 3 * panel_width} %{else} ${ 2 * panel_width} %{ endif },
                        "y": ${table_height + (panel_height * (1 + index))}
                      },
                      "hiddenSeries": false,
                      "id": ${315 + index},
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
                    }




            %{ endif }




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