view: testing_pdt {
  derived_table: {
    sql: SELECT
        bars.bar_name  AS bars_bar_name,
        bars.bar_category  AS bars_bar_category,
        COALESCE(SUM(bars.num_stars ), 0) AS bars_star
      FROM bars1.bars  AS bars

      GROUP BY 1,2
      ORDER BY 3 DESC
      LIMIT 20
       ;;
    sql_trigger_value:SELECT FLOOR(UNIX_TIMESTAMP() / (5*60)) ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bars_bar_name {
    type: string
    sql: ${TABLE}.bars_bar_name ;;
  }

  dimension: bars_bar_category {
    type: string
    sql: ${TABLE}.bars_bar_category ;;
  }

  dimension: bars_star {
    type: number
    sql: ${TABLE}.bars_star ;;
  }

  set: detail {
    fields: [bars_bar_name, bars_bar_category, bars_star]
  }
}
