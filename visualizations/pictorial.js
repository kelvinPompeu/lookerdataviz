looker.plugins.visualizations.add({
  id: "man_pictorial",
  label: "man pictorial",
  options: {
    min_font_size: {
      type: "number",
      label: "Minimum Font Size",
      default: 8,
      section: "Style"
    },
    color_positive_high: {
      type: "string",
      label: "Color for High Positive Change",
      default: "#005a32",
      section: "Colors",
      display: "color"
    }
  },
  create: function(element, config) {
    element.innerHTML = '<div id="stock-heatmap" style="width: 100%; height: 100%;"></div>';
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();
    done();
  }
});
