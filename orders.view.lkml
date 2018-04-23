view: orders {
  sql_table_name: Northwind2.Orders ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.OrderID ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EmployeeID ;;
  }

  dimension: freight {
    type: number
    sql: ${TABLE}.Freight ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}.OrderDate ;;
  }

  dimension_group: required {
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
    sql: ${TABLE}.RequiredDate ;;
  }

  dimension: ship_address {
    type: string
    sql: ${TABLE}.ShipAddress ;;
  }

  dimension: ship_city {
    type: string
    sql: ${TABLE}.ShipCity ;;
  }

  dimension: ship_country {
    type: string
    sql: ${TABLE}.ShipCountry ;;
  }

  dimension: ship_name {
    type: string
    sql: ${TABLE}.ShipName ;;
  }

  dimension: ship_postal_code {
    type: string
    sql: ${TABLE}.ShipPostalCode ;;
  }

  dimension: ship_region {
    type: string
    sql: ${TABLE}.ShipRegion ;;
  }

  dimension: ship_via {
    type: number
    sql: ${TABLE}.ShipVia ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.ShippedDate ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      order_id,
      ship_name,
      employees.first_name,
      employees.last_name,
      employees.employee_id,
      customers.contact_name,
      customers.company_name,
      customers.customer_id,
      order_details.count
    ]
  }
}
