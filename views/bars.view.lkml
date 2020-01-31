view: bars {
  sql_table_name: bars1.bars ;;

  dimension: bar_attire {
    type: string
    sql: ${TABLE}.bar_attire ;;
  }

  parameter: day_of_week {
    allowed_value: {
      label: "Monday"
      value: "Mon"
    }
    allowed_value: {
      label: "Tuesday"
      value: "Tue"
    }
    allowed_value: {
      label: "Wednesday"
      value: "Wed"
    }
    allowed_value: {
      label: "Thursday"
      value: "Thu"
    }
    allowed_value: {
      label: "Friday"
      value: "Fri"
    }
    allowed_value: {
      label: "Saturday"
      value: "Sat"
    }
    allowed_value: {
      label: "Sunday"
      value: "Sun"
    }
  }


  dimension: is_chosen_day {
    type: yesno
    hidden: yes
    sql: ${bar_bestnights_1} ={% parameter day_of_week %}
          OR ${bar_bestnights_2}={% parameter day_of_week %}
          OR ${bar_bestnights_3}={% parameter day_of_week%};;
  }

  measure: days_count{
    type: count
    label: "Bar DoW Count"
    filters:{

      field: is_chosen_day
      value: "Yes"
    }
  }

  dimension: bar_bestnights_1 {
    type: string
    hidden: yes
    sql: ${TABLE}.bar_bestnights_1 ;;
  }

  dimension: bar_bestnights_2 {
    type: string
    hidden: yes
    sql: ${TABLE}.bar_bestnights_2 ;;
  }

  dimension: bar_bestnights_3 {
    type: string
    hidden: yes
    sql: ${TABLE}.bar_bestnights_3 ;;
  }

  dimension: Monday {
    type: string
    group_label: "Day of Week"
    sql: bars.bar_bestnights_1='Mon' OR bars.bar_bestnights_2='Mon' OR bars.bar_bestnights_3='Mon';;
  }

  dimension: Tuesday {
    type: string
    group_label: "Day of Week"
    sql: bars.bar_bestnights_1='Tue' OR bars.bar_bestnights_2='Tue' OR bars.bar_bestnights_3='Tue';;
  }

  dimension: Wednesday {
    type: string
    group_label: "Day of Week"
    sql: contains(${bars.bar_bestnights_1},"Wed") OR contains(${bars.bar_bestnights_2},"Wed") OR contains(${bars.bar_bestnights_3},"Wed");;
  }

  dimension: Thursday {
    type: string
    group_label: "Day of Week"
    sql: contains(${bars.bar_bestnights_1},"Thu") OR contains(${bars.bar_bestnights_2},"Thu") OR contains(${bars.bar_bestnights_3},"Thu");;
  }

  dimension: Friday {
    type: string
    group_label: "Day of Week"
    sql: contains(${bars.bar_bestnights_1},"Fri") OR contains(${bars.bar_bestnights_2},"Fri") OR contains(${bars.bar_bestnights_3},"Fri");;
  }

  dimension: Saturday {
    type: string
    group_label: "Day of Week"
    sql: contains(${bars.bar_bestnights_1},"Sat") OR contains(${bars.bar_bestnights_2},"Sat") OR contains(${bars.bar_bestnights_3},"Sat");;
  }

  dimension: Sunday {
    type: string
    group_label: "Day of Week"
    sql: contains(${bars.bar_bestnights_1},"Sun") OR contains(${bars.bar_bestnights_2},"Sun") OR contains(${bars.bar_bestnights_3},"Sun");;
  }

  dimension: bar_dancing {
    type: string
    label: "Dancing"
    sql: ${TABLE}.bar_dancing ;;
    html:
    {% if value == 'Yes' %}
        <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
    {% elsif value == 'No' %}
        <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
        {% elsif value == 'N/A' %}
        <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
          {% endif %}


;;
  }

  dimension: bar_category {
    type: string
    label: "Category"
    sql: ${TABLE}.bar_category ;;
    link: {
      label: "Bar Categories"
      url: "/looks/39?&f[bars.bar_category]={{value}}"
    }
  }


  dimension: bar_happy {
    type: string
    label: "Happy Hour"
    sql: ${TABLE}.bar_happy ;;
    link: {
      label: "Bars by Happy Hour"
      url: "/looks/42?&f[bars.bar_happy]={{value}}"
    }
    html: {% if value == 'Yes' %}
        <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
    {% elsif value == 'No' %}
        <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
        {% elsif value == 'N/A' %}
        <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
          {% endif %} ;;
  }
#
#   #happy hour filter test
#   #
#   parameter: happy_hour {
#     type: string
#     label: "Happy Hour"
#     allowed_value: {
#       value: "Yes"
#     }
#     allowed_value: {
#       value: "No"
#     }
#     }
#
#     dimension: has_happy_hour {
#       type: yesno
#       hidden: no
#       sql: ${bar_happy} ={% parameter happy_hour %} ;;
#     }
#
#   measure: hh_count{
#     type: count
#     label: "HH Count"
#     filters:{
#
#       field: has_happy_hour
#       value: "Yes"
#     }
#   }


    dimension: bar_name {
      type: string
      primary_key:  yes
      sql: ${TABLE}.bar_name ;;
      link: {
        label: "Individual Bar"
        url: "https://localhost:9999/dashboards/9?Bar%20Name={{value}}"
      }
    }

    dimension: bar_outdoor {
      type: string
      label: "Outdoor Space"
      sql: ${TABLE}.bar_outdoor ;;
      link: {
        label: "Bars by Outdoor Space"
        url: "/looks/41?&f[bars.bar_outdoor]={{value}}"
      }
      html: {% if value == 'Yes' %}
        <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
    {% elsif value == 'No' %}
        <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
        {% elsif value == 'N/A' %}
        <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
          {% endif %} ;;
    }

    dimension: bar_nhood_1 {
      type: string
      hidden: yes
      sql: ${TABLE}.bar_nhood_1 ;;
    }

    dimension: bar_nhood_2 {
      type: string
      hidden: yes
      sql: ${TABLE}.bar_nhood_2 ;;
    }

    dimension: bar_nhood_3 {
      type: string
      hidden: yes
      sql: ${TABLE}.bar_nhood_3 ;;
    }

    dimension: bar_phone {
      type: string
      label: "Phone Number"
      sql: ${TABLE}.bar_phone ;;
    }

    dimension: bar_reservations {
      type: string
      label: "Reservations"
      sql: ${TABLE}.bar_reservations ;;
      link: {
        label: "Bars by Reservations"
        url: "/looks/43?&f[bars.bar_reservations]={{value}}"
      }
      html: {% if value == 'Yes' %}
      <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'No' %}
      <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'N/A' %}
      <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
      {% endif %} ;;
    }

    dimension: bar_tv {
      type: string
      label: "TV"
      sql: ${TABLE}.bar_tv ;;
      link: {
        label: "Bars by TV"
        url: "/looks/42?&f[bars.bar_tv]={{value}}"
      }
      html: {% if value == 'Yes' %}
      <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'No' %}
      <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'N/A' %}
      <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
      {% endif %} ;;
    }

    dimension: bar_wheelchair {
      type: string
      label: "Wheelchair Accessibility"
      sql: ${TABLE}.bar_wheelchair ;;
      link: {
        label: "Bars by Wheelchair Accessibility"
        url: "/looks/44?&f[bars.bar_wheelchair]={{value}}"
      }
      html: {% if value == 'Yes' %}
      <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'No' %}
      <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'N/A' %}
      <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
      {% endif %} ;;
    }

    dimension: credit_card {
      type: string
      label: "Credit Card"
      sql: ${TABLE}.creditCard ;;
      html: {% if value == 'Yes' %}
      <p style="color: green; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'No' %}
      <p style="color: red; font-size:100%; text-align:center">{{ value }}</p>
      {% elsif value == 'N/A' %}
      <p style="color: black; font-size:100%; text-align:center">{{ value }}</p>
      {% endif %} ;;
    }


    dimension: num_reviews {
      type: number
      sql: ${TABLE}.num_reviews ;;
    }

    measure: total_reviews {
      type: sum
      sql: ${num_reviews} ;;
    }

    dimension: num_stars {
      type: number
      sql: ${TABLE}.num_stars ;;
    }

    measure: star {
      type: sum
      sql: ${num_stars} ;;
    }

    measure: popularity_index {
      type: number
      label: "Popularity Index"
      sql: ${total_reviews}/${star} ;;
      value_format: "0.#"
    }


    dimension: number6_stars {
      type: number
      hidden: yes
      sql: ${TABLE}.number6_stars ;;
    }

#   dimension: popl_index {
#     type: number
#     sql: ${TABLE}.popl_index ;;
#   }
#
#   measure: popl_index_measure {
#     type: sum
#     value_format: "0.##"
#     sql: ${popl_index} ;;
#   }

    dimension: price_range {
      type: string
      sql: ${TABLE}.price_range ;;
      link: {
        label: "Bars by Price Range"
        url: "/looks/46?&f[bars.price_range]={{value}}"
      }
    }

    dimension: price {
      case: {
        when: {
          sql: ${TABLE}.price_range = "$" ;;
          label: "1"
        }
        when: {
          sql: ${TABLE}.price_range = "$$" ;;
          label: "2"
        }
        when: {
          sql: ${TABLE}.price_range = "$$$" ;;
          label: "3"
        }
        when: {
          sql: ${TABLE}.price_range = "$$$$" ;;
          label: "4"
        }
        else: "N/A"
      }
    }

    measure: count {
      type: count
      drill_fields: [bar_name]
    }
  }
