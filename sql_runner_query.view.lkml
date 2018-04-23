view: sql_runner_query {
  derived_table: {
    sql: SELECT
      suppliers.CompanyName  AS `suppliers.company_name`,
        SUM(order_details.UnitPrice*order_details.Quantity) AS total
      FROM Northwind2.Products  AS products
      LEFT JOIN Northwind2.Suppliers  AS suppliers ON products.SupplierID = suppliers.SupplierID
      LEFT JOIN Northwind2.Order_Details  AS order_details ON products.ProductID=order_details.ProductID

      WHERE
        ((suppliers.CompanyName IS NOT NULL))
      GROUP BY 1,order_details.UnitPrice*order_details.Quantity
      ORDER BY suppliers.CompanyName  DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: suppliers_company_name {
    type: string
    sql: ${TABLE}.`suppliers.company_name` ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [suppliers_company_name, total]
  }
}
