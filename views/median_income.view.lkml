view: median_income {
  derived_table: {
    sql: -- use existing bq_logrecno_bg_map in `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map`
      -- use existing bq_tract_zcta_map in `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map`
      SELECT
        LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0') AS tract_zcta_map_zcta5_1,
        COALESCE(SUM(block_group_facts.aggregate_income ), 0) AS block_group_facts_aggregate_income
      FROM `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map` AS fast_facts
      LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(fast_facts.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group
      LEFT JOIN `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map` AS tract_zcta_map ON fast_facts.geoid11 = tract_zcta_map.geoid

      GROUP BY 1
      ORDER BY 2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: zipcode {
    type: zipcode
    primary_key: yes
    sql: ${TABLE}.tract_zcta_map_zcta5_1 ;;
  }

  dimension: agg_income {
    type: number
    sql: ${TABLE}.block_group_facts_aggregate_income ;;
    value_format_name: usd
  }

  measure: median_income {
    type: median
    sql: ${agg_income} ;;
    value_format_name: usd
  }

  set: detail {
    fields: [zipcode, agg_income]
  }
}
