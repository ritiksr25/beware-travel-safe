import React, { Component } from "react";
import { Route, Switch, Redirect } from "react-router-dom";
import Home from "./components/home/home";
import * as ROUTES from "./utils/routes";
import axios from "axios";
import "./App.css";
import AddForm from "./components/addForm/add";
import Dashboard from "./components/dashboard/dashboard";
import Navbar from "./components/navbar/navbar";
import Logout from "./components/logout/logout";

class App extends Component {
  state = {
    loggedIn: false
  };

  //WARNING! To be deprecated in React v17. Use componentDidMount instead.
  UNSAFE_componentWillMount() {
    const token = localStorage.getItem("token");
    if (token) {
      this.setState({ loggedIn: true });
    }
  }

  render() {
    return (
      <React.Fragment>
        <Navbar user={this.state.loggedIn} />
        <Switch>
          <Route exact path="/home" component={Home} />
          <Route exact path="/add" component={AddForm} />
          <Route exact path="/dashboard" component={Dashboard} />
          <Route exact path="/logout" component={Logout} />
          <Redirect exact from="/" to="/home" />
          <Redirect to="/home" />
        </Switch>
      </React.Fragment>
    );
  }
}

export default App;
