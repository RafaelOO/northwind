view: 6_b {
  derived_table: {
    sql: SELECT EmployeeID, SUM(UnitPrice)
      FROM Orders
      INNER JOIN Order_Details
      ON Orders.OrderID = Order_Details.OrderID
      GROUP BY EmployeeID
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: employee_id {
    type: number
    sql: ${TABLE}.EmployeeID ;;
  }

  dimension: sumunit_price {
    type: number
    sql: ${TABLE}.`SUM(UnitPrice)` ;;
  }

  set: detail {
    fields: [employee_id, sumunit_price]
  }
}
