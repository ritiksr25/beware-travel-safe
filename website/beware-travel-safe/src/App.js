import React from "react";
import { Route, Switch, Redirect } from "react-router-dom";
import Home from "./components/home/home";
import "./App.css";
import AddForm from "./components/addForm/add";

function App() {
  return (
    <Switch>
      <Route exact path="/" component={Home} />
      <Route exact path="/add" component={AddForm} />
    </Switch>
  );
}

export default App;
