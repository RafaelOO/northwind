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
    sql: (
      SELECT OrderDate
      FROM Orders
      WHERE Orders.OrderID = ${TABLE}.OrderID
    ) ;;
    datatype:date # defaults to datetime
    convert_tz:  no
}

  measure: count {
    type: count
    drill_fields: [product_id,order_id,unit_price,quantity,discount]
  }
  measure: total_quantity {
    type: sum
    sql: ${quantity}*${unit_price} ;;
    }
    }

