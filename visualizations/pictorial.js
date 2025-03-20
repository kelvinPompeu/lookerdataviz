looker.plugins.visualizations.add({
  id: "man_pictorial",
  label: "man pictorial on bar grap",
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
    this.container = element.appendChild(document.createElement("div"));
    this.container.classList.add('pictorial-chart-container');
    console.log("create function called");

  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    console.log("update function called");
    console.log("data:", data);
    console.log("config:", config);
    console.log("queryResponse:", queryResponse);
    console.log("Config object:", config);

    // Configuration
    const imageUrl = config.imageUrl || "https://cdn-icons-png.flaticon.com/128/52/52902.png";
    const iconSize = config.iconSize || 25;
    const iconsPerUnit = config.iconsPerUnit || 100;

    const categoriaField = queryResponse.fields.dimensions.find(f => f.name.includes('Categoria')).name;
    const origemField = queryResponse.fields.dimensions.find(f => f.name.includes('origem')).name;
    const ValorField = queryResponse.fields.dimensions.find(f => f.name.includes('Valor')).name;

    // Prepare Data for Highcharts
    const seriesData = data.map(d => ({ // Add index to the map function

      const dataPoints = [];
      const iconCount = Math.floor(value / iconsPerUnit);

      for (let i = 0; i < iconCount; i++) {
        dataPoints.push({
          x: i + 1,  // Start from 1 instead of 0
          y: index,
          seriesName:  d[categoriaField].value,
          marker: {
            symbol: 'url(' + imageUrl + ')',
            width: iconSize,
            height: iconSize
          },
            category:  d[categoriaField].value,
            origem: d[origemField].value
        });
      }
      return {
        name: category,
        data: dataPoints
      };
    });

    Highcharts.chart(this.container, {
      chart: {
        type: 'scatter',
        plotBorderWidth: 1
      },
      title: {
        text: "Man pictorial bar graph"
      },
      xAxis: {
        title: {
          text: "Values"
        },
        min: 1,        // Adjust xAxis min to 1
        tickInterval: 2, // Further reduce the tick interval
        gridLineWidth: 0,  // Remove vertical grid lines
        labels: {
          enabled: true // Hide x axis labels
        }
      },
      legend: {
        enabled: true, // Enable the legend
        useHTML: true,
        labelFormatter: function() {
          if (this.name === "PictorialLegend") {
              return `<img src="${imageUrl}" style="width: ${iconSize}px; height: ${iconSize}px;"> = ${iconsPerUnit} People`;
          } else {
              return this.name;
          }
        },
          align: 'left',
          verticalAlign: 'bottom',
          layout: 'horizontal',
          x: 0,
          y: 40
      },
      tooltip: {
        enabled: true,
        useHTML: true,
        formatter: function() {
          return `
            <div>
              <b>Categoria:</b> ${this.point.category}<br>
              <b>Origem:</b> ${this.point.origem}
            </div>
          `;
        },
      },
      plotOptions: {
        scatter: {
          marker: {
            radius: 0
          }
        }
      },
      series: seriesData.concat([{ // Add a dummy series for the legend
          name: "PictorialLegend",
          data: [],
          marker: {
              symbol: `url(${imageUrl})`,
              width: iconSize,
              height: iconSize
          }
        }]),
      credits: {
        enabled: false
      }
    });
    done();
  }
});
