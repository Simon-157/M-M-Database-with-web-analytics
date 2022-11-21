import React, { useState, useEffect } from "react";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
// import { getEmployeeStatsData } from "../utils/fetchdata";
import axios from "axios";
import LineChart from "../components/LineChart";

const Orders = () => {
  const [data, setData] = useState([]);
  const [labels, setLabels] = useState([]);
  const [values, setValues] = useState([]);

  const handleClick = async () => {
    const Edata = await axios({
      method: "get",
      url: "http://localhost:5000/orders_count",
      withCredentials: true,
    });
    setData(Edata?.data);
    let newValues = Edata.data?.map(function (row) {
      return row.NumberOfOrders;
    });

    let newLabels = Edata.data?.map(function (row) {
      const d = new Date(row.date_order_made);
      return d.toLocaleDateString("en-us", {
        month: "long",
        day: "numeric",
      });
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
        label: "Total Orders ",
        backgroundColor: [
          "rgb(255, 99, 32)",
          "rgba(255, 99, 190)",
          "rgb(54, 162, 231)",
          "rgb(255, 255, 255)",
          "rgb(105, 105, 105)",
          "rgb(14, 162, 131)",
          "rgb(35, 65, 55)",
          "rgb(25, 205, 105)",
          "#253f4b",
          "#e7ef9e",
          "#c8dfea",
          "#d24e01",
        ],
        borderColor: "#ca5cdd",
        fill: false,
        weight: 5,
        borderWidth: 2,
        borderJoinStyle: "miter",
        animation: { animateScale: true },
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
          Order distribution for a given period 👇👇
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
        {data.length > 0 ? (
          <LineChart chartData={state} />
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

export default Orders;