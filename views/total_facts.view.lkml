view: total_facts {
  derived_table: {
    sql: -- use existing bq_tract_zcta_map in `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map`
      -- use existing bq_logrecno_bg_map in `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map`
      SELECT
        (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.aggregate_income ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0))/NULLIF((COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.housing_units ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)), 0)  AS TOTAL_avg_income_house,
          (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.total_population ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0))/NULLIF((COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.housing_units ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)), 0)  AS TOTAL_avg_persons_house,
            COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.total_population ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS TOTAL_population

      FROM bars1.bars  AS bars
      LEFT JOIN bars1.neighborhoods_zip  AS neighborhoods_zip ON bars.bar_nhood_1=neighborhoods_zip.neighborhoods
      INNER JOIN `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map` AS tract_zcta_map ON neighborhoods_zip.zipcode=cast((LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0')) as int64)
      LEFT JOIN `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map` AS fast_facts ON fast_facts.geoid11 = tract_zcta_map.geoid
      LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(fast_facts.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group

      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: avg_income_house {
    type: number
    sql: ${TABLE}.TOTAL_avg_income_house ;;
    value_format_name: usd_0
  }

  dimension: avg_persons_house {
    type: number
    sql: ${TABLE}.TOTAL_avg_persons_house ;;
    value_format_name: decimal_2

  }

  dimension: total_population {
    type: number
    sql: ${TABLE}.TOTAL_population ;;
    value_format_name: decimal_0

  }
  dimension: avg_population {
    type: number
    sql: ${total_population}/61 ;;
    value_format_name: decimal_0

  }

  set: detail {
    fields: [avg_income_house, avg_persons_house, total_population]
  }
}
