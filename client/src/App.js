import React from "react";
import { Route, Routes } from "react-router-dom";
import "./App.css";
import NavBar from "./components/NavBar";
import Employeestats from "./pages/Employeestats";
import RevenueService from "./pages/RevenueService";
import Home from "./pages/Home";
import Orders from "./pages/Orders";
import SubscriptionStat from "./pages/SubscriptionStats";
import Services from "./pages/Services";
import Inventory from "./pages/Inventory";
function App() {
  return (
    <div className="App">
      <NavBar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/employeestats" element={<Employeestats />} />
        <Route path="/service_revenue" element={<RevenueService />} />
        <Route path="/orders_count" element={<Orders />} />
        <Route path="/services" element={<Services />} />
        <Route path="/manage_inventory" element={<Inventory />} />
        <Route path="/std_staff_prop" element={<SubscriptionStat />} />
      </Routes>
    </div>
  );
}

export default App;
