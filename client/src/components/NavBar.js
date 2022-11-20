import React from "react";
import { NavLink } from "react-router-dom";
import { makeStyles } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import Button from "@material-ui/core/Button";

// import MenuIcon from "@material-ui/icons/Menu";

const useStyles = makeStyles((theme) => ({
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
}));

const Navbar = () => {
  const classes = useStyles();

  return (
    <AppBar
      // className={theme.palette.primary}
      position="static"
      color="secondary"
    >
      <Toolbar>
        <IconButton
          edge="start"
          color="inherit"
          aria-label="menu"
          className={classes.menuButton}
        >
          {/* <MenuIcon /> */}
        </IconButton>
        <Typography variant="h6" className={classes.title}>
          <NavLink style={{ color: "inherit", textDecoration: "none" }} to="/">
            M&M LAUNDARY
          </NavLink>
        </Typography>
        <Button color="inherit">
          <NavLink
            style={{ color: "inherit", textDecoration: "none" }}
            to="/employeestats"
          >
            Employee
          </NavLink>
        </Button>
        <Button color="inherit">
          <NavLink
            style={{ color: "inherit", textDecoration: "none" }}
            to="/orders"
          >
            Orders
          </NavLink>
        </Button>
        <Button color="inherit">
          <NavLink
            style={{ color: "inherit", textDecoration: "none" }}
            to="/service_revenue"
          >
            Revenue
          </NavLink>
        </Button>
        <Button color="inherit">
          <NavLink
            style={{ color: "inherit", textDecoration: "none" }}
            to="/equipment"
          >
            Equipment
          </NavLink>
        </Button>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;
