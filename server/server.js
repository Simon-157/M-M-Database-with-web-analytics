require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const cors = require("cors");
const app = express();
const port = process.env.PORT || 5000;

app.use(
  cors({
    origin: "http://localhost:3000",
    credentials: true,
  })
);

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

// MySQL
const pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  password: "",
  database: "laundry",
});

app.get("/", (req, res) => {
  res.send("Hello, welcome to M&M Laudary Service");
});

// Get all station
app.get("/station", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    connection.query("SELECT * from Station", (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from station table are: \n", rows);
    });
  });
});

// Delete a station
app.delete("/:id", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    connection.query(
      "DELETE FROM Station WHERE id = ?",
      [req.params.id],
      (err, rows) => {
        connection.release(); // return the connection to pool
        if (!err) {
          res.send(
            `Beer with the record ID ${[req.params.id]} has been removed.`
          );
        } else {
          console.log(err);
        }

        console.log("The data from beer table are: \n", rows);
      }
    );
  });
});

// -- Management to keep track of employees who have worked within a given month and the number of services rendered (Example month of November)
app.get("/employeestats", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `SELECT Employee.employeeId, Employee.fname, Employee.lname, COUNT(*) Total_Orders
    	FROM ServiceOrder
        INNER JOIN Employee on ServiceOrder.employeeId = Employee.employeeId
        WHERE ServiceOrder.date_order_done BETWEEN '2022-11-01' AND '2022-11-31'
        GROUP BY Employee.employeeId`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from station table are: \n", rows);
    });
  });
});

// -- Keeping track of customer orders
app.get("/customer_orders", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `SELECT ServiceOrder.serviceId, Employee.employeeId, Customer.customerId, Customer.fname, Customer.lname, Customer.email, ServiceOrder.service_used
    FROM (
        (ServiceOrder
            INNER JOIN Customer ON ServiceOrder.customerId = Customer.customerId)
            INNER JOIN Employee ON ServiceOrder.employeeId = Employee.employeeId
    	);`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from station table are: \n", rows);
    });
  });
});

// Total Revenue Generated from all service types done in this month

app.get("/service_revenue", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `SELECT ServiceOrder.serviceId, Service.service_type, SUM(Payment.amount_paid) Revenue
    FROM (
        (ServiceOrder
            INNER JOIN Service ON ServiceOrder.serviceId = Service.serviceId)
        	INNER JOIN Payment on ServiceOrder.serviceOrderId = Payment.ServiceOrderId
    	)
        WHERE ServiceOrder.date_order_made BETWEEN  '2022-1-22' AND  '2022-9-22'
        GROUP BY serviceId;`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from revenue service are: \n", rows);
    });
  });
});

app.get("/orders_count", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `Select Count(date_order_made) NumberOfOrders, date_order_made
	from ServiceOrder WHERE date_order_made BETWEEN '2022-10-10' AND '2022-11-31' GROUP BY date_order_made;`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }

      // if(err) throw err
      console.log("The data from revenue service are: \n", rows);
    });
  });
});

// To keep track of the number of customers on each type of subscription
app.get("/subscription", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `SELECT Subscription.subscription_type, Count(Subscribes_To.subscription_id) Count
    FROM Subscription
    INNER JOIN Subscribes_To on Subscription.subscriptionId = Subscribes_To.subscription_id
    GROUP BY Subscribes_To.subscription_id`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }
      console.log("The data from revenue service are: \n", rows);
    });
  });
});

// -- Management to keep determine the type of service used mostly by customers to be to manage inventory effectively for those services
app.get("/services", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `SELECT Service.service_type, COUNT(ServiceOrder.serviceId) Total_Orders
                    FROM ServiceOrder
                    INNER JOIN Service On ServiceOrder.serviceId = Service.serviceId
                    GROUP BY Service.serviceId;`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }
      console.log("The data from revenue service are: \n", rows);
    });
  });
});

// Manage the quantity of inventory present at a given time provided the time of supply is within the estimated time of getting out of stock.

app.get("/manage_inventory", (req, res) => {
  pool.getConnection((err, connection) => {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    const query = `SELECT item_name, quantity from inventory where (date_received BETWEEN '2022-06-01' AND '2022-10-31') AND quantity > 5;`;
    connection.query(query, (err, rows) => {
      connection.release(); // return the connection to pool

      if (!err) {
        res.send(rows);
      } else {
        console.log(err);
      }
      console.log("The data from revenue service are: \n", rows);
    });
  });
});

// Listen on enviroment port or 5000
app.listen(port, () => console.log(`Listening on port ${port}`));
