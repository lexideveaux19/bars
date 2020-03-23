view: agg_income_dt {
  derived_table: {
    sql: -- use existing bq_tract_zcta_map in `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map`
      -- use existing bq_logrecno_bg_map in `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map`
      SELECT
        block_group_facts.logrecno_bg_map_block_group  AS block_group_facts_logrecno_bg_map_block_group,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.aggregate_income ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS block_group_facts_aggregate_income
      FROM bars1.bars  AS bars
      LEFT JOIN neighborhoods.neighborhoods  AS neighborhoods ON bars.bar_nhood_1=neighborhoods.neighborhoods
      INNER JOIN `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map` AS tract_zcta_map ON neighborhoods.zipcode1=cast((LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0')) as int64)
      LEFT JOIN `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map` AS fast_facts ON fast_facts.geoid11 = tract_zcta_map.geoid
      LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(fast_facts.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group

      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 500
       ;;
    persist_for: "78 hours"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: map_block_group {
    type: string
    hidden : yes
    primary_key: yes
    sql: ${TABLE}.block_group_facts_logrecno_bg_map_block_group ;;
  }

  dimension: aggregate_income {
    type: number
    sql: ${TABLE}.block_group_facts_aggregate_income ;;
    value_format_name: usd_0
  }

  measure: avg_income {
    type: average
    sql: ${aggregate_income} ;;
    value_format_name: usd_0
  }

  set: detail {
    fields: [map_block_group, aggregate_income, avg_income]
  }

}
