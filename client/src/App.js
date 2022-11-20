import React from "react";
import { Route, Routes } from "react-router-dom";
import "./App.css";
import NavBar from "./components/NavBar";
import Employeestats from "./pages/Employeestats";
import RevenueService from "./pages/RevenueService";
import Home from "./pages/Home";
function App() {
  return (
    <div className="App">
      <NavBar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/employeestats" element={<Employeestats />} />
        <Route path="/service_revenue" element={<RevenueService />} />
      </Routes>
    </div>
  );
}

export default App;
