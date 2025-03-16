# The name of this view in Looker is "Noticias"
view: noticias {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `edp-k1-dwh-cur.edp_k1_dwh_cur_bq_0.noticias` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cidade" in Explore.

  dimension: cidade {
    type: string
    sql: ${TABLE}.cidade ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_noticia {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_noticia ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
    html:
      <a href="{{ value }}">Acessar notícia</a>
      ;;
  }

  dimension: origem {
    type: string
    sql: ${TABLE}.origem ;;

    html: {% if value == 'MARÍLIA NOTÍCIA'  %}
    <img src="https://marilianoticia.com.br/wp-content/themes/mn2023/assets/img/apple-touch-icon.png" width="12" height="12">

    {% elsif value == 'G1' %}
    <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Logotipo_G1.png" width="12" height="12">
    {% endif %}

    ;;
  }

  dimension: palavras_em_distaque {
    type: string
    sql: ${TABLE}.palavras_em_distaque ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;

    html: {% if value == 'artigo'  %}
    <img src="https://icon-library.com/images/articles-icon-png/articles-icon-png-18.jpg" width="14" height="14">

    {% elsif value == 'video' %}
    <img src="https://www.freeiconspng.com/thumbs/video-icon/video-icon-1.png" width="14" height="14">
    {% endif %}

    ;;

  }
  measure: count {
    type: count
  }
}
