view: stocks {
  view_label: "stocks"
  derived_table: {
    sql:
    SELECT
      "AAPL" AS Symbol, 244.60 AS current_price,  3.674 AS market_cap, "Technology" AS  sector, 3472 AS weekchange
    UNION ALL
    SELECT
      "NVDA" AS Symbol, 138.85 AS current_price,  3.400 AS market_cap, "Technology" AS  sector, 9992 AS weekchange
    UNION ALL
    SELECT
      "MSFT" AS Symbol, 408.43 AS current_price,  3.036 AS market_cap, "Technology" AS  sector, 140 AS weekchange
    UNION ALL
    SELECT
      "AMZN" AS Symbol, 228.68 AS current_price,  2.423 AS market_cap, "Consumer Cyclical"  AS  sector, 3687 AS weekchange
    UNION ALL
    SELECT
      "GOOG" AS Symbol, 186.87 AS current_price,  2.267 AS market_cap, "Communication Services" AS  sector, 3141 AS weekchange
    UNION ALL
    SELECT
      "META" AS Symbol, 736.67 AS current_price,  1.866 AS market_cap, "Communication Services" AS  sector, 5616 AS weekchange
    UNION ALL
    SELECT
      "TSLA" AS Symbol, 355.84 AS current_price,  1.145 AS market_cap, "Consumer Cyclical"  AS  sector, 8365 AS weekchange
    UNION ALL
    SELECT
      "WMT" AS Symbol,  104.04 AS current_price,  0.836 AS market_cap, "Consumer Defensive" AS  sector, 7748 AS weekchange
    UNION ALL
    SELECT
      "UNH" AS Symbol,  523.51 AS current_price,  0.482 AS market_cap, "Healthcare" AS  sector, 047 AS weekchange
    UNION ALL
    SELECT
      "XOM" AS Symbol,  108.24 AS current_price,  0.471 AS market_cap, "Energy" AS  sector, 534 AS weekchange
    UNION ALL
    SELECT
      "NFLX" AS Symbol, 1058.60 AS current_price,  0.453 AS market_cap, "Communication Services" AS  sector, 8406 AS weekchange
    UNION ALL
    SELECT
      "IBM" AS Symbol,  261.28 AS current_price,  0.242 AS market_cap, "Technology" AS  sector, 4243 AS weekchange
    UNION ALL
    SELECT
      "TMO" AS Symbol,  531.85 AS current_price,  0.203 AS market_cap, "Healthcare" AS  sector, -297 AS weekchange
    UNION ALL
    SELECT
      "UNP" AS Symbol,  249.22 AS current_price,  0.151 AS market_cap, "Industrials"  AS  sector,084 AS weekchange
    UNION ALL
    SELECT
      "LOW" AS Symbol,  251.79 AS current_price,  0.142 AS market_cap, "Consumer Cyclical"  AS  sector, 1165 AS weekchange
    UNION ALL
    SELECT
      "NEE" AS Symbol,  68.06 AS current_price,0.140 AS market_cap, "Utilities" AS  sector, 2023 AS weekchange
    UNION ALL
    SELECT
      "CMCSA" AS Symbol,  35.39 AS current_price, 0.134 AS market_cap, "Communication Services" AS  sector, -1505 AS weekchange
    UNION ALL
    SELECT
      "AMT" AS Symbol,  189.38 AS current_price,  0.088 AS market_cap, "Real Estate"  AS  sector, 052 AS weekchange
    UNION ALL
    SELECT
      "CL" AS Symbol, 86.04 AS current_price, 0.070 AS market_cap, "Consumer Defensive" AS  sector, 169 AS weekchange
    UNION ALL
    SELECT
      "EMR" AS Symbol,  123.34 AS current_price,  0.070 AS market_cap, "Industrials"  AS  sector, 1769 AS weekchange
    UNION ALL
    SELECT
      "KVUE" AS Symbol, 21.93 AS current_price, 0.042 AS market_cap, "Consumer Defensive" AS  sector, 1506 AS weekchange
    UNION ALL
    SELECT
      "PPG" AS Symbol,  117.75 AS current_price,  0.027 AS market_cap, "Basic Materials"  AS  sector, -1658 AS weekchange
    UNION ALL
    SELECT
      "TECK" AS Symbol, 43.08  AS current_price, 0.022 AS market_cap, "Basic Materials" AS  sector, 1367 AS weekchange
    UNION ALL
    SELECT
      "ESS" AS Symbol,  288.37 AS current_price,  0.020 AS market_cap, "Real Estate"  AS  sector, 2379 AS weekchange
    UNION ALL
    SELECT
      "BEN" AS Symbol,  20.53 AS current_price, 0.011 AS market_cap, "Financial Services" AS  sector, -2424 AS weekchange
    UNION ALL
    SELECT
      "LOW" AS Symbol,  251.79 AS current_price,  0.142 AS market_cap, "Consumer Cyclical"  AS  sector, 1165 AS weekchange
    UNION ALL
    SELECT
      "NEE" AS Symbol,  68.06 AS current_price,0.140 AS market_cap, "Utilities" AS  sector, 2023 AS weekchange
    UNION ALL
    SELECT
      "CMCSA" AS Symbol,  35.39 AS current_price, 0.134 AS market_cap, "Communication Services" AS  sector, -1505 AS weekchange
    UNION ALL
    SELECT
      "AMT" AS Symbol,  189.38 AS current_price,  0.088 AS market_cap, "Real Estate"  AS  sector, 0.52 AS weekchange
    UNION ALL
    SELECT
      "CL" AS Symbol, 86.04 AS current_price, 0070 AS market_cap, "Consumer Defensive" AS  sector, 169 AS weekchange
    UNION ALL
    SELECT
      "EMR" AS Symbol,  123.34 AS current_price,  0070 AS market_cap, "Industrials"  AS  sector, 1769 AS weekchange
    UNION ALL
    SELECT
      "KVUE" AS Symbol, 21.93 AS current_price, 0042 AS market_cap, "Consumer Defensive" AS sector, 1506 AS weekchange
    UNION ALL
    SELECT
      "PPG" AS Symbol,  117.75 AS current_price,  0027 AS market_cap, "Basic Materials"  AS  sector, -1658 AS weekchange
    UNION ALL
    SELECT
      "TECK" AS Symbol, 43.08  AS current_price, 0022 AS market_cap, "Basic Materials" AS sector, 1367 AS weekchange
    UNION ALL
    SELECT
      "ESS" AS Symbol,  288.37 AS current_price,  0020 AS market_cap, "Real Estate" AS  sector, 2379 AS weekchange
    UNION ALL
    SELECT
      "BEN" AS Symbol,  20.53 AS current_price, 0011 AS market_cap, "Financial Services" AS sector, -2424 AS weekchange
      ;;
    }

  dimension: symbol {
    type: string
    sql: ${TABLE}.Symbol ;;
  }

  dimension: current_price {
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.current_price ;;
  }

  dimension: market_cap {
      type: number
      value_format: "0.000\" T\""
      sql: ${TABLE}.market_cap ;;
    }

  dimension: sector {
      type: string
      sql: ${TABLE}.sector ;;
    }

  dimension: change {
    type: number
    value_format: "0.00%"
    sql: ${TABLE}.weekchange ;;
  }
}
