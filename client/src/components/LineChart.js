import { Line } from "react-chartjs-2";
const LineChart = ({ chartData }) => {
  return (
    <div
      style={{ height: "80%", width: "80%", maxWidth: "800px" }}
      className="chart-container"
    >
      <Line
        height=""
        width=""
        data={chartData}
        options={{
          scales: {
            xAxes: [
              {
                type: "time",
                distribution: "linear",
              },
            ],
            y: {
              title: {
                display: true,
                text: "Revenue",
                color: "#1e8e8e",
                paddingBottom: 5,
                font: { weight: "bold", size: 18 },
              },
              ticks: {
                font: { weight: "bold", size: 13 },
                color: "green",
                callback: function (value, index, ticks) {
                  return value;
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
                color: "#025043",
                paddingBottom: 5,
                font: { weight: "bold", size: 13 },
              },
            },
          },
          plugins: {
            title: {
              display: true,
              text: "Total orders distribution for month of November",
              font: {
                size: 20,
              },
              color: "#1e8e8e",
            },
            legend: {
              display: false,
              position: "right",
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
export default LineChart;
