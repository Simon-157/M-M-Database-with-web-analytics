import React, { useState, useEffect } from "react";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
// import { getEmployeeStatsData } from "../utils/fetchdata";
import axios from "axios";
// import PieChart from "../components/PieChart";
import { BarChart } from "../components/BarChart";

const Employeestats = () => {
  const [data, setData] = useState([]);
  const [labels, setLabels] = useState([]);
  const [values, setValues] = useState([]);

  const handleClick = async () => {
    const Edata = await axios({
      method: "get",
      url: "http://localhost:5000/service_revenue",
      withCredentials: true,
    });
    setData(Edata?.data);
    let newValues = data?.map(function (row) {
      return row.Revenue;
    });

    let newLabels = data?.map(function (row) {
      return row.service_type;
    });

    setLabels(newLabels);
    setValues(newValues);
    console.log(labels);
  };

  console.log(labels);
  console.log(values);

  const state = {
    labels: labels,
    datasets: [
      {
        label: "Total Revenue",
        backgroundColor: [
          "rgb(255, 99, 32)",
          "rgba(255, 99, 190)",
          "rgb(54, 162, 231)",
          "rgb(255, 255, 255)",
          "rgb(105, 105, 105)",
          "rgb(14, 162, 131)",
          "rgb(35, 65, 55)",
          "rgb(25, 205, 105)",
        ],
        borderColor: "rgba(255, 99, 132, 0.2)",
        weight: 5,
        borderWidth: 4,
        barThickness: 65,
        data: values,
      },
    ],
  };

  useEffect(() => {
    return () => {};
  }, [setData]);

  return (
    <div>
      <Typography font="large">
        <h2
          style={{ color: "#1e8e8e", textAlign: "center", paddingTop: "10px" }}
        >
          Total Revenue Generated from all service types done in this month 👇👇
        </h2>
      </Typography>
      <div
        style={{
          width: "100%",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        {data ? (
          <Button
            variant="outlined"
            color="primary"
            onClick={() => {
              handleClick();
            }}
          >
            View
          </Button>
        ) : (
          <Button
            variant="outlined"
            color="primary"
            onClick={() => {
              handleClick();
            }}
          >
            Hide
          </Button>
        )}
      </div>
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        {values?.length !== 0 && <BarChart chartData={state} />}
      </div>
    </div>
  );
};

export default Employeestats;
