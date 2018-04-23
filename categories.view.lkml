view: categories {
  sql_table_name: Northwind2.Categories ;;

  dimension: category_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CategoryID ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.CategoryName ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: picture {
    type: string
    sql: ${TABLE}.Picture ;;
  }

  measure: count {
    type: count
    drill_fields: [category_id, category_name]
  }
}
