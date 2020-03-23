connection: "bars_bigquery_db"

# include all the views
include: "/views/**/*.view"

include: "//demographic_block/*.view"

datagroup: lexi_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lexi_thesis_default_datagroup

explore: total_facts {}
explore: bars {
#   join: median_income {
#     relationship: one_to_one
#     type: inner
#     sql_on: ${neighborhoods_zip.zipcode}=cast(${median_income.zipcode} as int64) ;;
#   }
  join: neighborhoods_zip {
    relationship: many_to_many
    sql_on: ${bars.bar_nhood_1}=${neighborhoods_zip.neighborhood} ;;
  }
  join: tract_zcta_map{
  from: bq_tract_zcta_map
    type: inner
    relationship: many_to_one
    sql_on: ${neighborhoods_zip.zipcode}=${tract_zcta_map.ZCTA5} ;;
  }
  join: fast_facts {
    from: bq_logrecno_bg_map
    sql_on: ${fast_facts.geoid11} = ${tract_zcta_map.geoid11} ;;
    relationship: many_to_one
  }
    join: block_group_facts {
     from: bq_block_group_facts
     view_label: "Fast Facts"
     sql_on: ${fast_facts.block_group} = ${block_group_facts.logrecno_bg_map_block_group};;
    relationship: one_to_one
   }

#   join: agg_income_dt {
#     sql_on: ${fast_facts.block_group} = ${agg_income_dt.map_block_group} ;;
#     relationship: one_to_one
#   }

persist_for: "24 hours"
}
