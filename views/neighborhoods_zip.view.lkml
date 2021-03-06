view: neighborhoods_zip {
  sql_table_name: bars1.neighborhoods_zip ;;

  dimension: neighborhood {
    type: string
    sql: ${TABLE}.neighborhoods ;;
    link: {
      label: "Neighborhood Breakdown by DoW"
       url: "https://localhost:9999/dashboards/8?Neighborhood={{value}}&Day%20of%20Week={{ _filters['bars.day_of_week'] | url_encode }}"
      }
    link: {
      label: "Neighborhood Breakdown"
      url: "https://localhost:9999/dashboards/11?Neighborhood={{value}}"
    }

  }

  dimension: zipcode {
    type: zipcode
    sql: cast(${TABLE}.zipcode as string) ;;
  }

  measure: Total_Best_Bars {
    type: count
    drill_fields: []
  }

#
#   filter: neighborhood_filter {
#     suggest_dimension: neighborhood
#   }
#
#   dimension: is_neighborhood {
#     type: yesno
#     sql: ${neighborhood} = {% parameter neighborhood_filter %} ;;
#   }
#
#   measure: bars_count_by_neighborhood {
#     type: count
#     filters: {
#       field: is_neighborhood
#       value: "Yes"
#     }
#   }



}
