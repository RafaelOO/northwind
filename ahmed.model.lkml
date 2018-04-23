connection: "northwind_2"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: northwind_challenge_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: northwind_challenge_default_datagroup

explore: categories {}

explore: customer_customer_demo {
  join: customers {
    type: left_outer
    sql_on: ${customer_customer_demo.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: customer_demographics {}

explore: customers {}

explore: employee_territories {
  join: employees {
    type: left_outer
    sql_on: ${employee_territories.employee_id} = ${employees.employee_id} ;;
    relationship: many_to_one
  }
}

explore: employees {}

explore: order_details {
  join: orders {
    type: left_outer
    sql_on: ${order_details.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${order_details.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: employees {
    type: left_outer
    sql_on: ${orders.employee_id} = ${employees.employee_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }

  join: suppliers {
    type: left_outer
    sql_on: ${products.supplier_id} = ${suppliers.supplier_id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: employees {
    type: left_outer
    sql_on: ${orders.employee_id} = ${employees.employee_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: suppliers {
    type: left_outer
    sql_on: ${products.supplier_id} = ${suppliers.supplier_id} ;;
    relationship: many_to_one
  }
}

explore: region {}

explore: shippers {}

explore: suppliers {}

explore: territories {
  join: region {
    type: left_outer
    sql_on: ${territories.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}

explore: usstates {}
