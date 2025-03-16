# The name of this view in Looker is "Shape File Cdhu"
view: shape_file_cdhu {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `edp-k1-dwh-cur.edp_k1_dwh_cur_bq_0.Shape_file_CDHU` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bairro" in Explore.

  dimension: bairro {
    type: string
    sql: ${TABLE}.BAIRRO ;;
  }

  dimension: codsisplan {
    type: string
    sql: ${TABLE}.CODSISPLAN ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATA ;;
  }

  dimension: distrito {
    type: string
    sql: ${TABLE}.DISTRITO ;;
  }

  dimension: emplasa_artic {
    type: string
    sql: ${TABLE}.EMPLASA_ARTIC ;;
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}.ENDERECO ;;
  }

  dimension: idterreno {
    type: number
    sql: ${TABLE}.IDTERRENO ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_idterreno {
    type: sum
    sql: ${idterreno} ;;  }
  measure: average_idterreno {
    type: average
    sql: ${idterreno} ;;  }

  dimension: info_divisa {
    type: string
    sql: ${TABLE}.INFO_DIVISA ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: matricula {
    type: string
    sql: ${TABLE}.MATRICULA ;;
  }

  dimension: municipio {
    map_layer_name: Sp
    type: string
    sql: ${TABLE}.MUNICIPIO ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}.NOME ;;
  }

  dimension: sit_patrimonial {
    type: string
    sql: ${TABLE}.SIT_PATRIMONIAL ;;
  }

  dimension: sit_tecnica {
    type: string
    sql: ${TABLE}.SIT_TECNICA ;;
  }

  dimension: subprefeitura {
    type: string
    sql: ${TABLE}.SUBPREFEITURA ;;
  }

  dimension: sup_analise_m2 {
    type: number
    sql: ${TABLE}.SUP_ANALISE_m2 ;;
  }

  dimension: sup_matr_m2 {
    type: number
    sql: ${TABLE}.SUP_MATR_m2 ;;
  }

  dimension: sup_poligono_m2 {
    type: number
    sql: ${TABLE}.SUP_POLIGONO_m2 ;;
  }

  dimension: sup_topog_m2 {
    type: number
    sql: ${TABLE}.SUP_TOPOG_m2 ;;
  }

  dimension: uhs_construida {
    type: number
    sql: ${TABLE}.UHS_Construida ;;
  }

  dimension: uhs_em_obras {
    type: number
    sql: ${TABLE}.UHS_EmObras ;;
  }

  dimension: uhs_em_projeto {
    type: number
    sql: ${TABLE}.UHS_EmProjeto ;;
  }

  measure: count {
    type: count
  }
}
