view: usstates {
  sql_table_name: Northwind2.USStates ;;

  dimension: state_abbr {
    type: string
    sql: ${TABLE}.StateAbbr ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.StateID ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.StateName ;;
  }

  dimension: state_region {
    type: string
    sql: ${TABLE}.StateRegion ;;
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}
