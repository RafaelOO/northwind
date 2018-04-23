view: employee_territories {
  sql_table_name: Northwind2.EmployeeTerritories ;;

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EmployeeID ;;
  }

  dimension: territory_id {
    type: string
    sql: ${TABLE}.TerritoryID ;;
  }

  measure: count {
    type: count
    drill_fields: [employees.first_name, employees.last_name, employees.employee_id]
  }
}
