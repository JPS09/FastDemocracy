import Chart from "chart.js";

// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/


const DATA_COUNT = 5;
const NUMBER_CFG = { count: DATA_COUNT, min: 0, max: 100 };

const targets = document.querySelectorAll(".my-chart")
console.log(targets)

const newCharts = () => {
    if (targets) {
      targets.forEach( (target) => {
        const answersPerItem = JSON.parse(target.dataset.answers)
        const answersContent = JSON.parse(target.dataset.contents).map(d => d.replace(/&#8216/, "\'"));
        new Chart(target, {
          type: 'doughnut',
          data: {
            labels: answersContent,
            datasets: [
              {
                label: 'Nombre de votes pour cette question',
                data: answersPerItem,
                backgroundColor: ["#080708", "#3772ff", "#df2935", "#fdca40", "#e6e8e6", "#d2d6ef"]
              }
            ]
          },
        },
          {
            options: {
              responsive: true,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: 'Chart.js Doughnut Chart'
                }
              }
            }
          }
        );
      })
    };
  };



export { newCharts };
