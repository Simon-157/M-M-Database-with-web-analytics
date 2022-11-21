import { Bar } from "react-chartjs-2";
import "chart.js/auto";
export const HorizontalBar = ({ chartData }) => {
  return (
    <div className="chart-container" styles={{}}>
      <Bar
        data={chartData}
        height="590vh"
        width="900px"
        options={{
          indexAxis: "y",
          elements: {
            bar: {
              borderWidth: 2,
            },
          },
          scales: {
            y: {
              title: {
                display: true,
                text: "Service Type",
                color: "#1e8e8e",
                paddingBottom: 5,
                font: { weight: "bold", size: 18 },
              },
              ticks: {
                color: "#192A53",
                paddingBottom: 5,
                font: { weight: "bold", size: 15 },
              },
            },
            x: {
              title: {
                display: true,
                text: "Frequency of each service",
                color: "#1e8e8e",
                paddingBottom: 5,
                font: { weight: "bold", size: 18 },
              },
              ticks: {
                color: "green",
                callback: function (value, index, ticks) {
                  return value;
                },
              },
            },
          },

          plugins: {
            title: {
              display: true,
              text: "Total Number of each type of service used",
              font: {
                size: 20,
              },
              color: "#1e8e8e",
            },
            legend: {
              align: "center",
              maxHeight: 70,
              display: false,
              position: "bottom",
              labels: {
                color: "#038e8e",
                padding: 15,
                font: { size: 18 },
              },
            },
            tooltips: {
              enabled: true,
            },
          },
        }}
      />
    </div>
  );
};
