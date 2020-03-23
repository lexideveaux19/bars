view: sql_runner_query {
  derived_table: {
    sql: -- use existing bq_tract_zcta_map in looker_scratch.LR_JHPIE1580744058094_bq_tract_zcta_map
      -- use existing bq_logrecno_bg_map in looker_scratch.LR_JHS9I1580744041398_bq_logrecno_bg_map
      SELECT
        (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.aggregate_income ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0))/NULLIF((COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.housing_units ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)), 0)  AS block_group_facts_avg_income_house,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.housing_units ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS block_group_facts_housing_units,
        (COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.total_population ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0))/NULLIF((COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.housing_units ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0)), 0)  AS block_group_facts_avg_persons_house,
        COALESCE(ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE(block_group_facts.total_population ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST(block_group_facts.logrecno_bg_map_block_group  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6), 0) AS block_group_facts_total_population
      FROM bars1.bars  AS bars
      LEFT JOIN bars1.neighborhoods_zip  AS neighborhoods_zip ON bars.bar_nhood_1=neighborhoods_zip.neighborhoods
      INNER JOIN looker_scratch.LR_JHPIE1580744058094_bq_tract_zcta_map AS tract_zcta_map ON (cast(neighborhoods_zip.zipcode as string))=(LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0'))
      LEFT JOIN looker_scratch.LR_JHS9I1580744041398_bq_logrecno_bg_map AS fast_facts ON fast_facts.geoid11 = tract_zcta_map.geoid
      LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(fast_facts.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: block_group_facts_avg_income_house {
    type: number
    sql: ${TABLE}.block_group_facts_avg_income_house ;;
  }

  dimension: block_group_facts_housing_units {
    type: number
    sql: ${TABLE}.block_group_facts_housing_units ;;
  }

  dimension: block_group_facts_avg_persons_house {
    type: number
    sql: ${TABLE}.block_group_facts_avg_persons_house ;;
  }

  dimension: block_group_facts_total_population {
    type: number
    sql: ${TABLE}.block_group_facts_total_population ;;
  }

  set: detail {
    fields: [block_group_facts_avg_income_house, block_group_facts_housing_units, block_group_facts_avg_persons_house, block_group_facts_total_population]
  }
}
