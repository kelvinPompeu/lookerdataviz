looker.plugins.visualizations.add({
  id: "man_pictorial",
  label: "man pictorial on bar grap",
  options: {
    min_font_size: {
      type: "number",
      label: "Minimum Font Size",
      default: 8,
      section: "Style"
    }
  },
  create: function(element, config) {
    this.container = element.appendChild(document.createElement("div"));
    this.container.classList.add('pictorial-chart-container');
    console.log("create function called");
  },
  updateAsync: function(data, element, config, queryResponse, done) {
    console.error("update function called");
    console.error("data:", data);
    console.error("config:", config);
    console.error("queryResponse:", queryResponse);
    console.error("Configobject:", config);

    done();

  }
});
