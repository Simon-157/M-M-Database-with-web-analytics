import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import { Typography, Button } from "@material-ui/core";
import { Link } from "react-router-dom";
import Fade from "@material-ui/core/Fade";
import { useTheme } from "@material-ui/core/styles";
import useMediaQuery from "@material-ui/core/useMediaQuery";

const useStyles = makeStyles(() => ({
  hero: {
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
    alignItems: "center",
    minHeight: "100vh",
    backgroundImage:
      "linear-gradient(to right, rgba(0,0,0,.6),rgba(0,0,0,.4)), url(https://www.laundry-man.com/wp-content/uploads/2021/04/1.jpg)",
    backgroundSize: "cover",
    backgroundPosition: "center",
    color: "#fff",
  },

  h2: {
    letterSpacing: "4px",
    textAlign: "center",
    opacity: 0,
  },

  h4: {
    marginBottom: "2rem",
    textAlign: "center",
  },
}));

const Home = () => {
  const theme = useTheme();
  const matches = useMediaQuery(theme.breakpoints.down("xs"));
  const classes = useStyles();
  return (
    <section className={classes.hero}>
      <Fade in timeout={{ enter: 2000 }}>
        <Typography
          variant="h2"
          className={classes.h2}
          style={matches ? { fontSize: "2rem" } : { fontSize: "4rem" }}
          gutterBottom
        >
          Cleanliness invites <b style={{ color: "#ed1c65" }}>adventure</b>
        </Typography>
      </Fade>
      <Fade in timeout={{ enter: 2000 }}>
        <Typography
          variant="h4"
          className={classes.h4}
          gutterBottom
          style={matches ? { fontSize: "1.5rem" } : { fontSize: "2rem" }}
        >
          With laundry fresh, your clothes will be left smelling great and
          <br />
          <strong> looking even better ✔🤞</strong>
        </Typography>
      </Fade>
      <Fade in timeout={{ enter: 2000 }}>
        <Button
          color="inherit"
          variant="contained"
          component={Link}
          to="/"
          disableElevation
        >
          <Typography variant="subtitle1">SUBSCRIBE</Typography>
        </Button>
      </Fade>
    </section>
  );
};

export default Home;
