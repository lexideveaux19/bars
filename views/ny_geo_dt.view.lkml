view: ny_geo_dt {
  derived_table: {
    sql: -- use existing bq_logrecno_bg_map in `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map`
      -- use existing bq_tract_zcta_map in `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map`
      SELECT
        CONCAT(fast_facts.county_name, ', ', fast_facts.state_name) AS fast_facts_county_name,
        LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0') AS tract_zcta_map_zcta5_1,
        (COALESCE(SUM(block_group_facts.under_18 ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_under_18,
        (COALESCE(SUM(block_group_facts.eighteen_to_64 ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_18_64,
        (COALESCE(SUM(block_group_facts.sixty_five_and_over ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_65_over,
        (COALESCE(SUM(block_group_facts.hispanic_or_latino ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_hispanic_or_latino,
        1-((COALESCE(SUM(block_group_facts.hispanic_or_latino ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0))  AS block_group_facts_pct_non_hispanic_or_latino,
        (COALESCE(SUM(block_group_facts.white_non_hisp ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_white_nh2,
        (COALESCE(SUM(block_group_facts.aggregate_income ), 0))/NULLIF((COALESCE(SUM(block_group_facts.housing_units ), 0)), 0)  AS block_group_facts_avg_income_house,
        (COALESCE(SUM(block_group_facts.total_population ), 0))/NULLIF((COALESCE(SUM(block_group_facts.housing_units ), 0)), 0)  AS block_group_facts_avg_persons_house,
        COALESCE(SUM(block_group_facts.housing_units ), 0) AS block_group_facts_housing_units,
        (COALESCE(SUM(block_group_facts.amind_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_amind,
        (COALESCE(SUM(block_group_facts.asian_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_asian,
        (COALESCE(SUM(block_group_facts.black_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_black,
        (COALESCE(SUM(block_group_facts.nat_haw_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_nathaw,
        (COALESCE(SUM(block_group_facts.white_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_white,
        (COALESCE(SUM(block_group_facts.white_non_hisp ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_white_nh,
        (COALESCE(SUM(block_group_facts.female ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_female,
        (COALESCE(SUM(block_group_facts.male ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_male,
        COALESCE(SUM(block_group_facts.total_population ), 0) AS block_group_facts_total_population
      FROM `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map` AS fast_facts
      LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(fast_facts.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group
      LEFT JOIN `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map` AS tract_zcta_map ON fast_facts.geoid11 = tract_zcta_map.geoid

      WHERE
        (CONCAT(fast_facts.county_name, ', ', fast_facts.state_name) IN ('Kings County, New York', 'Queens County, New York', 'New York County, New York'))
      GROUP BY 1,2

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.fast_facts_county_name ;;
  }

  dimension: zipcode {
    type: zipcode
    label: "Zipcode"
    primary_key: yes
    sql: ${TABLE}.tract_zcta_map_zcta5_1 ;;
    link: {
      label: "Neighborhoods Overview"
      url: "https://localhost:9999/dashboards/7?Day%20of%20Week={{ _filters['bars.day_of_week'] | url_encode }}"
    }
  }

  dimension: block_group_facts_pct_under_18 {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_under_18 ;;
  }
  measure: pct_under_18 {
    type: sum
    sql: ${block_group_facts_pct_under_18} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_18_64 {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_18_64 ;;
  }

  measure: pct_18_64 {
    type: sum
    sql: ${block_group_facts_pct_18_64} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_65_over {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_65_over ;;
  }

  measure: pct_65_over {
    type: sum
    sql: ${block_group_facts_pct_65_over} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_hispanic_or_latino {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_hispanic_or_latino ;;
  }

  measure: pct_hispanic_or_latino {
    type: sum
    sql: ${block_group_facts_pct_hispanic_or_latino} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_non_hispanic_or_latino {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_non_hispanic_or_latino ;;
  }

  measure: pct_non_hispanic_or_latino {
    type: sum
    sql: ${block_group_facts_pct_non_hispanic_or_latino} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_white_nh2 {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_white_nh2 ;;
  }

  measure: pct_white_nh2 {
    type: sum
    sql: ${block_group_facts_pct_white_nh2} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_avg_income_house {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_avg_income_house ;;
  }

  measure: avg_income_house {
#     type: sum
    type: average
    sql: ${block_group_facts_avg_income_house} ;;
    value_format_name: usd
  }

  dimension: block_group_facts_avg_persons_house {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_avg_persons_house ;;
  }

  measure: avg_persons_house {
    type: sum
    sql: ${block_group_facts_avg_persons_house} ;;
    value_format: "##.00"
  }

  dimension: block_group_facts_housing_units {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_housing_units ;;
  }

  measure: housing_units {
    type: sum
    sql: ${block_group_facts_housing_units} ;;
  }

  dimension: block_group_facts_pct_amind {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_amind ;;
  }

  measure: pct_amind {
    type: sum
    label: "Pct American Indian or Native Alaskan"
    sql: ${block_group_facts_pct_amind} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_asian {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_asian ;;
  }

  measure: pct_asian {
    type: sum
    sql: ${block_group_facts_pct_asian} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_black {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_black ;;
  }

  measure: pct_black {
    type: sum
    sql: ${block_group_facts_pct_black} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_nathaw {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_nathaw ;;
  }

  measure: pct_nathaw {
    type: sum
    label: "Pct Native Hawaiian or Other Pacific Islander"
    sql: ${block_group_facts_pct_nathaw} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_white {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_white ;;
  }

  measure: pct_white {
    type: sum
    sql: ${block_group_facts_pct_white} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_white_nh {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_white_nh ;;
  }

  measure: pct_white_nh {
    type: sum
    sql: ${block_group_facts_pct_white_nh} ;;
    value_format_name: percent_2

  }

  dimension: block_group_facts_pct_female {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_female ;;
    value_format_name: percent_2
  }

  measure: pct_female {
    type: sum
    sql: ${block_group_facts_pct_female} ;;
    value_format_name: percent_2
  }

  dimension: block_group_facts_pct_male {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_pct_male ;;
  }

  measure: pct_male {
    type: sum
    sql: ${block_group_facts_pct_male} ;;
    value_format_name: percent_2
  }

  dimension: block_group_facts_total_population {
    type: number
    hidden: yes
    sql: ${TABLE}.block_group_facts_total_population ;;
  }

  measure: total_population {
    type: sum
    sql: ${block_group_facts_total_population} ;;
  }



  set: detail {
    fields: [
      county_name,
      zipcode,
      block_group_facts_pct_under_18,
      block_group_facts_pct_18_64,
      block_group_facts_pct_65_over,
      block_group_facts_pct_hispanic_or_latino,
      block_group_facts_pct_non_hispanic_or_latino,
      block_group_facts_pct_white_nh2,
      block_group_facts_avg_income_house,
      block_group_facts_avg_persons_house,
      block_group_facts_housing_units,
      block_group_facts_pct_amind,
      block_group_facts_pct_asian,
      block_group_facts_pct_black,
      block_group_facts_pct_nathaw,
      block_group_facts_pct_white,
      block_group_facts_pct_white_nh,
      block_group_facts_pct_female,
      block_group_facts_pct_male,
      block_group_facts_total_population,
      pct_female,
      pct_under_18
    ]
  }
}
