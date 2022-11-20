import { Bar } from "react-chartjs-2";
import "chart.js/auto";
export const BarChart = ({ chartData }) => {
  return (
    <div
      className="chart-container"
      styles={{ height: "100%", width: "100%", maxWidth: "800px" }}
    >
      {/* <h2 style={{ color: "#e8e8e8", textAlign: "center" }}>Bar Chart</h2> */}
      <Bar
        data={chartData}
        height="490px"
        width="490px"
        options={{
          scales: {
            y: {
              title: {
                display: true,
                text: "Revenue",
                color: "#1e8e8e",
                paddingBottom: 5,
                font: { weight: "bold", size: 18 },
              },
              ticks: {
                color: "green",
                callback: function (value, index, ticks) {
                  return "$" + value;
                },
              },
            },
            x: {
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
          },
          plugins: {
            title: {
              display: true,
              text: "Revenue generated from each service for the month of November",
              font: {
                size: 20,
              },
              color: "#1e8e8e",
            },
            legend: {
              align: "center",
              maxHeight: 50,
              display: false,
              position: "",
              labels: {
                color: "#038e8e",
                padding: 15,
                font: { size: 18 },
              },
            },
            tooltips: {
              enabled: false,
            },
          },
        }}
      />
    </div>
  );
};
