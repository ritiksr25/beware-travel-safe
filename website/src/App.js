import React from "react";
import { Route, Switch, Redirect } from "react-router-dom";
import Home from "./components/home/home";
import "./App.css";
import AddForm from "./components/addForm/add";
import Dashboard from "./components/dashboard/dashboard";

function App() {
  return (
    <Switch>
      <Route path="/home" component={Home} />
      <Route path="/add" component={AddForm} />
      <Route path="/dashboard" component={Dashboard} />
      <Redirect exact from="/" to="/home" />
    </Switch>
  );
}

export default App;
