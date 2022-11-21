import React, { useState } from "react";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
// import { getEmployeeStatsData } from "../utils/fetchdata";
import axios from "axios";
// import PieChart from "../components/PieChart";
import { BarChart } from "../components/BarChart";

const Inventory = () => {
  const [data, setData] = useState([]);
  const [labels, setLabels] = useState([]);
  const [values, setValues] = useState([]);

  const handleClick = async () => {
    const Edata = await axios({
      method: "get",
      url: "http://localhost:5000/manage_inventory",
      withCredentials: true,
    });
    setData(Edata?.data);
    let newValues = Edata.data?.map(function (row) {
      return row.quantity;
    });

    let newLabels = Edata.data?.map(function (row) {
      return row.item_name;
    });

    setLabels(newLabels);
    setValues(newValues);
    console.log(labels);
  };

  console.log(labels);
  console.log(values);

  const state = {
    title: "Inventory present from supply since June this month",
    symbol: "",
    labels: labels,
    datasets: [
      {
        label: "Quantity Left",
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

  // useEffect(() => {}, [setData, data, handleClick]);

  return (
    <div>
      <Typography font="large">
        <h2
          style={{ color: "#1e8e8e", textAlign: "center", paddingTop: "10px" }}
        >
          Inventory Management for a given period 👇👇
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
        {/* {data ? ( */}
        <Button
          variant="outlined"
          color="primary"
          onClick={() => {
            handleClick();
          }}
        >
          View
        </Button>
      </div>
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          justifyContent: "center",
          alignItems: "center",
        }}
      >
        {data.length > 0 ? (
          <BarChart chartData={state} />
        ) : (
          <h3
            style={{
              color: "#1e8e8e",
              textAlign: "center",
              paddingTop: "10px",
            }}
          >
            click to view loading....
          </h3>
        )}
      </div>
    </div>
  );
};

export default Inventory;
