view: employees {
  sql_table_name: Northwind2.Employees ;;

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.EmployeeID ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension_group: birth {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.BirthDate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.Extension ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension_group: hire {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.HireDate ;;
  }

  dimension: home_phone {
    type: string
    sql: ${TABLE}.HomePhone ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.Notes ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.Photo ;;
  }

  dimension: photo_path {
    type: string
    sql: ${TABLE}.PhotoPath ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: reports_to {
    type: number
    sql: ${TABLE}.ReportsTo ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: title_of_courtesy {
    type: string
    sql: ${TABLE}.TitleOfCourtesy ;;
  }
  dimension: Employees_name {
    type: string
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
  }
  measure: count {
    type: count
    drill_fields: [employee_id, first_name, last_name, employee_territories.count, orders.count]
  }
}
