view: products {
  sql_table_name: Northwind2.Products ;;

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ProductID ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.CategoryID ;;
  }

  dimension: discontinued {
    type: yesno
    sql: ${TABLE}.Discontinued ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
  }

  dimension: quantity_per_unit {
    type: string
    sql: ${TABLE}.QuantityPerUnit ;;
  }

  dimension: reorder_level {
    type: number
    sql: ${TABLE}.ReorderLevel ;;
  }

  dimension: supplier_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SupplierID ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  dimension: units_in_stock {
    type: number
    sql: ${TABLE}.UnitsInStock ;;
  }

  dimension: units_on_order {
    type: number
    sql: ${TABLE}.UnitsOnOrder ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_stock {
    type: sum
    sql: ${units_in_stock} ;;
  }

  measure: total_value_stock {
    type: sum
    sql: ${units_in_stock} * ${unit_price};;
    value_format_name: usd
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product_id,
      product_name,
      suppliers.contact_name,
      suppliers.company_name,
      suppliers.supplier_id,
      order_details.count
    ]
  }
}
