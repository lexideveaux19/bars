view: ny_geo {
  derived_table: {
    sql: -- use existing bq_logrecno_bg_map in `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map`
      -- use existing bq_tract_zcta_map in `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map`
      SELECT
        CONCAT(fast_facts.county_name, ', ', fast_facts.state_name) AS fast_facts_county_name,
        LPAD(CAST(tract_zcta_map.ZCTA5 as STRING), 5, '0') AS tract_zcta_map_zcta5_1,
        (COALESCE(SUM(block_group_facts.under_18 ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_under_18,
        (COALESCE(SUM(block_group_facts.eighteen_to_64 ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_18_64,
        (COALESCE(SUM(block_group_facts.sixty_five_and_over ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_65_over,
        COALESCE(SUM(block_group_facts.under_18 ), 0) AS block_group_facts_under_18,
        COALESCE(SUM(block_group_facts.eighteen_to_64 ), 0) AS block_group_facts_eighteen_to_64,
        COALESCE(SUM(block_group_facts.sixty_five_and_over ), 0) AS block_group_facts_sixty_five_and_over,
        (COALESCE(SUM(block_group_facts.hispanic_or_latino ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_hispanic_or_latino,
        COALESCE(SUM(block_group_facts.hispanic_or_latino ), 0) AS block_group_facts_hispanic_or_latino,
        1-((COALESCE(SUM(block_group_facts.hispanic_or_latino ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0))  AS block_group_facts_pct_non_hispanic_or_latino,
        (COALESCE(SUM(block_group_facts.white_non_hisp ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_white_nh2,
        (COALESCE(SUM(block_group_facts.aggregate_income ), 0))/NULLIF((COALESCE(SUM(block_group_facts.housing_units ), 0)), 0)  AS block_group_facts_avg_income_house,
        (COALESCE(SUM(block_group_facts.total_population ), 0))/NULLIF((COALESCE(SUM(block_group_facts.housing_units ), 0)), 0)  AS block_group_facts_avg_persons_house,
        COALESCE(SUM(block_group_facts.housing_units ), 0) AS block_group_facts_housing_units,
        (COALESCE(SUM(block_group_facts.amind_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_amind,
        COALESCE(SUM(block_group_facts.amind_alone_or_in_combo ), 0) AS block_group_facts_amind_alone_or_in_combo,
        (COALESCE(SUM(block_group_facts.asian_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_asian,
        COALESCE(SUM(block_group_facts.asian_alone_or_in_combo ), 0) AS block_group_facts_asian_alone_or_in_combo,
        COALESCE(SUM(block_group_facts.black_alone_or_in_combo ), 0) AS block_group_facts_black_alone_or_in_combo,
        (COALESCE(SUM(block_group_facts.black_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_black,
        (COALESCE(SUM(block_group_facts.nat_haw_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_nathaw,
        COALESCE(SUM(block_group_facts.nat_haw_alone_or_in_combo ), 0) AS block_group_facts_nat_haw_alone_or_in_combo,
        COALESCE(SUM(block_group_facts.white_alone_or_in_combo ), 0) AS block_group_facts_white_alone_or_in_combo,
        (COALESCE(SUM(block_group_facts.white_alone_or_in_combo ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_white,
        (COALESCE(SUM(block_group_facts.white_non_hisp ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_white_nh,
        COALESCE(SUM(block_group_facts.white_non_hisp ), 0) AS block_group_facts_white_non_hisp,
        (COALESCE(SUM(block_group_facts.female ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_female,
        COALESCE(SUM(block_group_facts.female ), 0) AS block_group_facts_female_population,
        (COALESCE(SUM(block_group_facts.male ), 0))/NULLIF((COALESCE(SUM(block_group_facts.total_population ), 0)), 0)  AS block_group_facts_pct_male,
        COALESCE(SUM(block_group_facts.male ), 0) AS block_group_facts_male_population,
        COALESCE(SUM(block_group_facts.total_population ), 0) AS block_group_facts_total_population,
        COALESCE(SUM(fast_facts.square_miles_land ), 0) AS fast_facts_sq_miles_land,
        COALESCE(SUM(fast_facts.square_miles_water ), 0) AS fast_facts_sq_miles_water
      FROM `looker-project-264614.looker_scratch.LR_JHS9IKKZGPAUG4Y09M4GH_bq_logrecno_bg_map` AS fast_facts
      LEFT JOIN `looker-datablocks.acs_fast_facts.fast_facts`  AS block_group_facts ON (SUBSTR(fast_facts.geoid, 8, 12)) = block_group_facts.logrecno_bg_map_block_group
      LEFT JOIN `looker-project-264614.looker_scratch.LR_JHPIE75PENZT1FZWOZCF_bq_tract_zcta_map` AS tract_zcta_map ON fast_facts.geoid11 = tract_zcta_map.geoid

      WHERE
        (CONCAT(fast_facts.county_name, ', ', fast_facts.state_name) IN ('Queens County, New York', 'Kings County, New York', 'New York County, New York'))
      GROUP BY 1,2
      ORDER BY 3 DESC
      LIMIT 500
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
    sql: ${TABLE}.tract_zcta_map_zcta5_1 ;;
  }

  measure: pct_under_18 {
    label: "% of Population 17 years and younger"
    type: number
    sql: ${TABLE}.block_group_facts_pct_under_18 ;;
    group_label: "Age"
    value_format_name: percent_2
  }
#   dimension: block_group_facts_pct_under_18 {
#     type: number
#     sql: ${TABLE}.block_group_facts_pct_under_18 ;;
#   }
  measure: pct_18_64 {
    label: "% of Population 18 and 64 years"
    type: number
    sql: ${TABLE}.block_group_facts_pct_18_64 ;;
    group_label: "Age"
    value_format_name: percent_2
  }

  measure: pct_65_over {
    label: "% of Population 65 and older"
    type: number
    sql: ${TABLE}.block_group_facts_pct_65_over ;;
    group_label: "Age"
    value_format_name: percent_2
  }

  measure: under_18 {
    label: "Population 17 years and younger"
    type: sum
    sql: ${TABLE}.block_group_facts_under_18 ;;
    group_label: "Age"
  }

  measure: eighteen_to_64 {
    label: "Population 18 to 64 years"
    type: sum
    sql: ${TABLE}.block_group_facts_eighteen_to_64 ;;
    group_label: "Age"
  }

  measure: sixty_five_and_over {
    label: "Population 65 years and older"
    type: sum
    sql: ${TABLE}.block_group_facts_sixty_five_and_over ;;
    group_label: "Age"
  }

  measure: pct_hispanic_or_latino {
    label: "Hispanic or Latino % of Population (Any Race)"
    type: number
    sql: ${TABLE}.block_group_facts_pct_hispanic_or_latino ;;
    group_label: "Hispanic/Latino"
    value_format_name: percent_2
  }

  measure: hispanic_or_latino {
    label: "Hispanic or Latino Population (Any Race)"
    type: sum
    sql: ${TABLE}.block_group_facts_hispanic_or_latino ;;
    group_label: "Hispanic/Latino"
  }

  measure: pct_non_hispanic_or_latino {
    label: "Non-Hispanic, Non-Latino % of Population (Any Race)"
    type: number
    sql: ${TABLE}.block_group_facts_pct_non_hispanic_or_latino ;;
    group_label: "Hispanic/Latino"
    value_format_name: percent_2
  }

  measure: pct_white_nh2 {
    label: "White, Non-Hispanic % of Population"
    group_label: "Hispanic/Latino"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_white_nh2 ;;
    }


  measure: avg_income_house {
    type: number
    group_label: "Households"
    label: "Average Income per Household"
    sql: ${TABLE}.block_group_facts_avg_income_house ;;
    value_format_name: usd_0
  }

  measure: avg_persons_house {
    type: number
    group_label: "Households"
    label: "Average Persons per Household"
    sql: ${TABLE}.block_group_facts_avg_persons_house ;;
    value_format_name: decimal_2
  }

  measure: housing_units {
    type: sum
    group_label: "Households"
    sql: ${TABLE}.block_group_facts_housing_units ;;
    }

  measure: pct_amind {
    label: "American Indian or Native Alaskan % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_amind ;;
    }

  measure: amind_alone_or_in_combo {
    label: "American Indian or Native Alaskan Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.block_group_facts_amind_alone_or_in_combo ;;
    }

  measure: pct_asian {
    label: "Asian % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_asian ;;
    }

  measure: asian_alone_or_in_combo {
    label: "Asian Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.block_group_facts_asian_alone_or_in_combo ;;
    }

  measure: black_alone_or_in_combo {
    label: "Black or African American Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.block_group_facts_black_alone_or_in_combo ;;
    }

  measure: pct_black {
    label: "Black/African American % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_black ;;
    }

  measure: pct_nathaw {
    label: "Native Hawaiian or Other Pacific Islander % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_nathaw ;;
    }

  measure: nat_haw_alone_or_in_combo {
    label: "Native Hawaiian or Other Pacific Islander (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.block_group_facts_nat_haw_alone_or_in_combo ;;
    }

  measure: white_alone_or_in_combo {
    label: "White Population (Alone or in Combo with Other Races)"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.block_group_facts_white_alone_or_in_combo ;;
    }

  measure: pct_white {
    label: "White % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_white ;;
    }

  measure: pct_white_nh {
    label: "White, Non-Hispanic % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.block_group_facts_pct_white_nh ;;
    }

  measure: white_non_hisp {
    label: "White, Non-Hispanic Population"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.block_group_facts_white_non_hisp ;;
    }

  measure: female_population {
    type: sum
    sql: ${TABLE}.block_group_facts_female_population ;;
    group_label: "Sex"
  }

  measure:  pct_female{
    type: number
    label: "Female % of Population"
    group_label: "Sex"
    sql: ${TABLE}.block_group_facts_pct_female ;;
    value_format_name: percent_2
  }

  measure:  pct_male{
    type: number
    label: "Male % of Population"
    group_label: "Sex"
    sql: ${TABLE}.block_group_facts_pct_male ;;
    value_format_name: percent_2
  }

  measure: male_population {
    type: sum
    sql: ${TABLE}.block_group_facts_male_population ;;
    group_label: "Sex"
  }

  measure: total_population {
    description: "Total Population"
    type: sum
    sql: ${TABLE}.block_group_facts_total_population ;;
    }
#   dimension: block_group_facts_total_population {
#     type: number
#     sql: ${TABLE}.block_group_facts_total_population ;;
#   }
  measure: sq_miles_land {
    sql: ${TABLE}.fast_facts_sq_miles_land ;;
    label: "Square Miles of Land"
    type: sum
    value_format_name: decimal_2
  }

  measure: sq_miles_water {
    sql: ${TABLE}.fast_facts_sq_miles_water ;;
    label: "Square Miles of Water"
    type: sum
    value_format_name: decimal_2
  }


  set: detail {
    fields: [
      county_name,
      zipcode,
      pct_under_18,
      pct_18_64,
      pct_65_over,
      under_18,
      eighteen_to_64,
      sixty_five_and_over,
      pct_hispanic_or_latino,
      hispanic_or_latino,
      pct_non_hispanic_or_latino,
      pct_white_nh2,
      avg_income_house,
      avg_persons_house,
      housing_units,
      pct_amind,
      amind_alone_or_in_combo,
      pct_asian,
      asian_alone_or_in_combo,
      black_alone_or_in_combo,
      pct_black,
      pct_nathaw,
      nat_haw_alone_or_in_combo,
      white_alone_or_in_combo,
      pct_white,
      pct_white_nh,
      white_non_hisp,
      pct_female,
      female_population,
      pct_male,
      male_population,
      total_population,
      sq_miles_land,
      sq_miles_water
    ]
  }
}
