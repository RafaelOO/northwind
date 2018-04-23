view: customer_customer_demo {
  sql_table_name: Northwind2.CustomerCustomerDemo ;;

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: customer_type_id {
    type: string
    sql: ${TABLE}.CustomerTypeID ;;
  }

  measure: count {
    type: count
    drill_fields: [customers.contact_name, customers.company_name, customers.customer_id]
  }
}
