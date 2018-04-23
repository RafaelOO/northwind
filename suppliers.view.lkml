view: suppliers {
  sql_table_name: Northwind2.Suppliers ;;

  dimension: supplier_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SupplierID ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.CompanyName ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.ContactName ;;
  }

  dimension: contact_title {
    type: string
    sql: ${TABLE}.ContactTitle ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.Fax ;;
  }

  dimension: home_page {
    type: string
    sql: ${TABLE}.HomePage ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  measure: count {
    type: count
    drill_fields: [supplier_id, contact_name, company_name, products.count]
  }
}
