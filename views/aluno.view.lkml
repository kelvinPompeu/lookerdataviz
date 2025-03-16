# The name of this view in Looker is "Aluno"
view: aluno {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `edp-k1-dwh-cur.edp_k1_dwh_cur_bq_0.Aluno`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Ingresso" in Explore.

  dimension: ano_ingresso {
    type: number
    sql: ${TABLE}.Ano_Ingresso ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ano_ingresso {
    type: sum
    sql: ${ano_ingresso} ;;
  }

  measure: average_ano_ingresso {
    type: average
    sql: ${ano_ingresso} ;;
  }

  dimension: ativo {
    type: string
    sql: ${TABLE}.Ativo ;;
  }

  dimension: cep {
    type: zipcode
    sql: ${TABLE}.CEP ;;
  }

  dimension: disciplina_cursadas {
    type: number
    sql: ${TABLE}.DisciplinaCursadas ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: municipio {
    map_layer_name: municipio
    sql: ${TABLE}.Municipio ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}.Nome ;;
  }

  dimension: nome_completo {
    type: string
    sql: CONCAT(${TABLE}.Nome," ",${TABLE}.NomeCurso) ;;
  }

  dimension: nome_curso {
    type: string
    sql: ${TABLE}.NomeCurso ;;
  }

  dimension: rua {
    type: string
    sql: ${TABLE}.Rua ;;
  }

  dimension: salario_minimo {
    type: number
    sql: ${TABLE}.Salario_minimo ;;
  }

  dimension: telefone {
    type: string
    sql: ${TABLE}.Telefone ;;
  }

  dimension: trabalhando {
    type: string
    sql: ${TABLE}.Trabalhando ;;
  }

  dimension: uf {
    type: string
    sql: ${TABLE}.UF ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: total_gross_margin {
    type: string
    value_format_name: usd
    sql:  ${TABLE}.UF  ;;
    html:
    <div style="width:100%"> <details>
    <summary style="outline:none">{{ total_gross_margin._linked_value }}
    </summary> Salario Minimo: {{ salario_minimo._linked_value }}
    <br/>
    municipio : {{ municipio._linked_value }}
    </details>
      </div>;;
  }



  measure: m_salario_minimo {
    type: number
    sql: ${TABLE}.Salario_minimo ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: porgentagem_vendas {
    type: count
    drill_fields: []
  }
  measure: max_vendas {
    type: max
    drill_fields: []
  }

  measure: min_vendas {
    type: min
    drill_fields: []
  }
}
