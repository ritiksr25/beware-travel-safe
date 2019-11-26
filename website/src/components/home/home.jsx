import React, { Component } from "react";
import { Redirect } from "react-router-dom";
import mainImg from "./mainImg.svg";
import mainImg2 from "./mainImg2.svg";
import * as ROUTES from "../../utils/routes";
import axios from "axios";
import "./style.css";

class Home extends Component {
  constructor(props) {
    super(props);
    let loggedIn = false;
    this.state = {
      email: "",
      password: "",
      loggedIn
    };
    this.onChange = this.onChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  onChange(e) {
    this.setState({
      [e.target.name]: e.target.value
    });
  }

  handleSubmit = async e => {
    e.preventDefault();
    const { email, password } = this.state;
    let payload = {
      email: email,
      password: password
    };
    try {
      const response = await axios.post(ROUTES.loginUrl, payload);
      if (response.status === 200) {
        localStorage.setItem("token", response.headers["x-auth-token"]);
        this.setState({ loggedIn: true });
      }
    } catch (err) {
      if (err.response === undefined) console.log(err.message);
      else console.log(err.response);
    }
  };

  render() {
    if (this.state.loggedIn) {
      return <Redirect to="/dashboard" />;
    }
    return (
      <React.Fragment>
        <div className="fluid-container">
          <nav className="navbar navbar-expand-lg navbar-light bg-light">
            <div className="container">
              <a
                className="navbar-brand tag text-left"
                style={{
                  fontWeight: "700",
                  color: "#7B65E4",
                  fontSize: "22px"
                }}
              >
                Travel Safe
              </a>
              <button
                className="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
              >
                <i className="fa fa-bars"></i>
              </button>

              <div
                className="collapse navbar-collapse"
                id="navbarSupportedContent"
              >
                <ul
                  className="navbar-nav mr-auto nav justify-content-end custom_nav"
                  style={{ width: "100%" }}
                >
                  <li className="nav-item">
                    <a className="nav-link ">About Us</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <div className="main">
            <div className="container">
              <div className="row pt-4">
                <div className="col-lg-6 quote-pos">
                  <img className="img-fluid" src={mainImg2} alt="img" />
                  <p className="quote">
                    Choose Us <br />
                    Travel Safe
                  </p>
                </div>
                <div className="col-lg-6">
                  <form onSubmit={this.handleSubmit}>
                    <div className="card card-edit">
                      <div className="text-center mt-3">
                        <p className="heading">
                          <span className="underline">Log In</span>
                        </p>
                        <img
                          className="img-fluid m-2"
                          src={mainImg}
                          alt="login-img"
                        />
                      </div>
                      <div className="form-group mx-4 mt-3">
                        <input
                          type="email"
                          name="email"
                          className="form-control"
                          placeholder="Email"
                          value={this.state.email}
                          onChange={this.onChange}
                        />
                      </div>
                      <div className="form-group mx-4">
                        <input
                          type="password"
                          name="password"
                          className="form-control"
                          placeholder="Password"
                          value={this.state.password}
                          onChange={this.onChange}
                        />
                      </div>
                      <button
                        className="btn btn-primary mx-4 mb-4"
                        type="submit"
                      >
                        Log In
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div className="about mt-4 mb-4">
            <div className="container">
              <div className="text-center">
                <p className="heading">
                  <span className="underline">About</span>
                </p>
                <p
                  className="m-3"
                  style={{
                    fontWeight: "300",
                    color: "#707070",
                    fontSize: "22px"
                  }}
                >
                  A mobile-based platform that uses route-wise and time-wise
                  previous data records of crime rates and vulnerability to
                  accidents and suggest the most favorable and optimum route so
                  that our users can travel safely.
                </p>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Home;
