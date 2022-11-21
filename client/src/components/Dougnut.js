import { Doughnut } from "react-chartjs-2";
import "chart.js/auto";

const Dougnut = ({ chartData }) => {
  return (
    <div
      styles={{
        height: "100%",
        width: "60vw",
        maxWidth: "600px",
      }}
    >
      {/* <h2 style={{ color: "#e8e8e8", textAlign: "center" }}>Pie Chart</h2> */}
      <Doughnut
        data={chartData}
        height="490px"
        width="490px"
        paddingButtom="30px"
        options={{
          // maintainAspectRatio: true,
          plugins: {
            title: {
              display: true,
              text: "Employees Activeness For the month of November",
              font: {
                size: 20,
              },
              color: "#1e8e8e",
            },
            legend: {
              align: "center",
              maxHeight: 50,
              display: true,
              position: "right",
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
export default Dougnut;
