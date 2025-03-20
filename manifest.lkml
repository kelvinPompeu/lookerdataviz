project_name: "tre-to"

visualization: {
  id: "kelvin_Viz"
  label: "kelvin_Viz"
  file: "visualizations/my_local.js"
  dependencies: [
    "https://code.jquery.com/jquery-2.2.4.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/4.13.0/d3.js",
    "https://code.highcharts.com/highcharts.js"
  ]
}

visualization: {
  id: "stockvisualizationcard"
  label: "Stock visualization card with format selection"
  file: "visualizations/stock_visualization_card.js"
}

application: kitchen {
  label: "pompeu kitchen React/TypeScript extension"
  url: "https://localhost:8080/bundle.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","search_folders", "run_inline_query", "me", "all_looks", "run_look"]
    external_api_urls: ["http://127.0.0.1:3000", "http://localhost:3000", "https://*.googleapis.com", "https://*.github.com"]

    }

}
