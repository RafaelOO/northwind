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

  dimension_group: order_date {
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
    sql: (SELECT order_date FROM orders WHERE order_details.order_id = orders.orders_id) ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.ship_name, orders.order_id, products.product_name, products.product_id]
  }

  measure: total_price {
    type: sum
    sql:  ${unit_price} * ${quantity} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
  }
}
