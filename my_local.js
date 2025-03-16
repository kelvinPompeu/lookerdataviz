looker.plugins.visualizations.add({
  create: function(element, config) {
    this.container = element.appendChild(document.createElement("div"));
    this.container.classList.add('pictorial-chart-container');
    console.log("create function called");
  },
  update: function(data, element, config, queryResponse) {
    console.log("update function called");
    console.log("data:", data);
    console.log("config:", config);
    console.log("queryResponse:", queryResponse);
    console.log("Config object:", config);

    // Configuration
    const imageUrl = config.imageUrl || "https://cdn-icons-png.flaticon.com/128/52/52902.png";
    const iconSize = config.iconSize || 25;
    const iconsPerUnit = config.iconsPerUnit || 100;

    // Prepare Data for Highcharts
    const seriesData = data.map((row, index) => { // Add index to the map function
      const category = row.Categoria;
      const value = row.Valor;

      const dataPoints = [];
      const iconCount = Math.floor(value / iconsPerUnit);

      for (let i = 0; i < iconCount; i++) {
        dataPoints.push({
          x: i + 1,  // Start from 1 instead of 0
          y: index,
          seriesName: category,
          marker: {
            symbol: 'url(' + imageUrl + ')',
            width: iconSize,
            height: iconSize
          }
        });
      }
      return {
        name: category,
        data: dataPoints
      };
    });

    // Render Highcharts
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
      yAxis: {
        title: {
          text: "Categories"
        },
        categories: data.map(row => row.Categoria),  // Set category names
        reversed: true, // Reverse categories to display in the correct order
        labels: {
          useHTML: true,
          formatter: function() {
            const index = this.axis.categories.indexOf(this.value);
            if (index !== -1 && data[index]) {
              return `<span style="float:left">${this.value}</span><span style="float:right">(${data[index].Valor})</span>`;
            } else {
              return this.value;
            }
          },
          style: {
            width: '150px', // Adjust width as needed
            whiteSpace: 'nowrap',
            overflow: 'hidden',
            textOverflow: 'ellipsis',
            textAlign: 'left'
          }
        },
        min: 0,
        max: data.length - 1,
        tickInterval: 1,
        gridLineWidth: 0  // Remove horizontal grid lines
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
        enabled: false
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
  }
});
