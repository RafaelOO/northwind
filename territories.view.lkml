view: territories {
  sql_table_name: Northwind2.Territories ;;

  dimension: territory_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.TerritoryID ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.RegionID ;;
  }

  dimension: territory_description {
    type: string
    sql: ${TABLE}.TerritoryDescription ;;
  }

  measure: count {
    type: count
    drill_fields: [territory_id, region.region_id]
  }
}
