import axios from "axios";

export const getEmployeeStatsData = async () => {
  const data = await axios({
    method: "get",
    url: "http://localhost:5000/employeestats",
    withCredentials: true,
  });
  console.log(data);
  return data.data;
};
