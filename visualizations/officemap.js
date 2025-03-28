looker.plugins.visualizations.add({
  id: "heatmap_floorplan",
  label: "Mapa de Calor Planta Baixa",
  create: function(element, config) {
    this.chart = null;
    this.container = element.appendChild(document.createElement("div"));
    this.container.style.width = "100%";
    this.container.style.height = "100%";
  },
  update: function(data, element, config, queryResponse) {
    if (!data || data.length === 0) {
      this.chart ? this.chart.destroy() : null;
      this.container.innerHTML = "Nenhum dado para exibir.";
      return;
    }

    const dimensionFieldX = queryResponse.fields.dimensions[0]; // Dimensão para X (colunas)
    const dimensionFieldY = queryResponse.fields.dimensions[1]; // Dimensão para Y (linhas)
    const measureField = queryResponse.fields.measures[0];       // Medida para a intensidade

    console.log("dimensionFieldX", dimensionFieldX )
    console.log("dimensionFieldY", dimensionFieldY )
    console.log("measureField", measureField)
    
    if (!dimensionFieldX || !dimensionFieldY || !measureField) {
      this.container.innerHTML = "Certifique-se de selecionar uma dimensão para X, uma dimensão para Y e uma medida.";
      return;
    }

    // Processar os dados do Looker para o formato do Highcharts
    const seriesData = data.map(row => {

    console.log("row[dimensionFieldX]", row[dimensionFieldX])
    console.log("row[dimensionFieldY]", row[dimensionFieldY])
    console.log("row[measureField]", row[measureField])

      return {
        x: 4,
        y: 2,
        value: 100,
        
      };
    });

   const options = {
      chart: {
        type: 'heatmap',
        height: '100%',
        plotBackgroundImage: 'https://datavis.blog/wp-content/uploads/2021/10/floor-1.png?w=1314' // Evita que o Highcharts tente colocar a imagem
      },
      title: {
        text: 'Mapa de Calor da Planta Baixa'
      },
      xAxis: {
        visible: false,
        margin: 0,
        minPadding: 0,
        maxPadding: 0
      },
      yAxis: {
        visible: false,
        endOnTick: false,
        minPadding: 0,
        maxPadding: 0
      },
      tooltip: {
        pointFormat: `X: {point.x}, Y: {point.y}, Valor: {point.value}`
      },
      colorAxis: {
        stops: [
            [0, 'rgba(61, 0, 255, 0.2)'],
            [0.3, 'rgba(0, 255, 188, 0.3)'],
            [0.6, 'rgba(194, 255, 0, 0.6)'],
            [0.9, 'rgba(255, 0, 67, 0.9)']
        ]
      },
      series: [{
        name: 'Intensidade',
        data: [
            [0, 0, 10], [0, 1, 19], [0, 2, 8], [0, 3, 24], [0, 4, 67],
            [1, 0, 156], [1, 1, 154], [1, 2, 78], [1, 3, 117], [1, 4, 48],
            [2, 0, 160], [2, 1, 149], [2, 2, 123], [2, 3, 64], [2, 4, 52],
            [3, 0, 72], [3, 1, 56], [3, 2, 114], [3, 3, 19], [3, 4, 16],
            [4, 0, 38], [4, 1, 5], [4, 2, 8], [4, 3, 117], [4, 4, 115],
            [5, 0, 88], [5, 1, 32], [5, 2, 12], [5, 3, 6], [5, 4, 120],
            [6, 0, 13], [6, 1, 44], [6, 2, 88], [6, 3, 98], [6, 4, 96],
            [7, 0, 31], [7, 1, 1], [7, 2, 82], [7, 3, 32], [7, 4, 30],
            [8, 0, 85], [8, 1, 97], [8, 2, 123], [8, 3, 64], [8, 4, 84],
            [9, 0, 47], [9, 1, 114], [9, 2, 31], [9, 3, 48], [9, 4, 91]
        ],
        borderWidth: 0, // Sem bordas nas células
        nullColor: 'rgba(0,0,0,0)', // Células sem dados transparentes
        interpolation: true // Sem interpolação entre as células
      }],
      responsive: {
        rules: [{
          condition: {
            minWidth:600 // Ajuste conforme necessário
          },
          chartOptions: {
            chart: {
              height: 550 // Ajuste conforme necessário
            }
          }
        }]
      }
    };

    if (!this.chart) {
      this.chart = Highcharts.chart(this.container, options);
    } else {
      this.chart.update(options);
    }
  }
});