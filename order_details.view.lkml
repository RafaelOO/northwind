view: order_details {
  sql_table_name: Northwind2.Order_Details ;;

  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.OrderID ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  measure: amount_per_each_order {
    type: number
    sql:  ${TABLE}.Quantity * ${TABLE}.UnitPrice ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.ship_name, orders.order_id, products.product_name, products.product_id]
  }
}
