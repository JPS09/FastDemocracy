import Chart from "chart.js";

// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/


const DATA_COUNT = 5;
const NUMBER_CFG = { count: DATA_COUNT, min: 0, max: 100 };

const target = document.querySelector("#my-chart")

const newChart = () => {
  if(target) {
    new Chart(target, {
      type: 'doughnut',
      labels: ['Red', 'Orange', 'Yellow', 'Green', 'Blue'],
      data: {
        datasets: [
          {
            label: 'Dataset 1',
            data: [1, 25, 37, 12],
            // data: Utils.numbers(NUMBER_CFG),
            backgroundColor: 'rgba(0, 0, 0, 0.1)',
          }
        ]}
      ,
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
  };
};

export { newChart };
