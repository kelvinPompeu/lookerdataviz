project_name: "tre-to"

visualization: {
  id: "stock_sector_heatmap"
  label: "Stock Sector Heatmap"
  file: "visualizations/stock_visualization.js"
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
