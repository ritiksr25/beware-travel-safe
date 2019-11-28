import React, { Component } from "react";
import { Link } from "react-router-dom";
import "./style.css";

class AddForm extends Component {
  state = {};
  render() {
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
                href="#"
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
                    <Link className="nav-link " to="/dashboard">
                      Dashboard
                    </Link>
                  </li>
                  <li className="nav-item">
                    <a className="nav-link " href="#">
                      Log Out
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <div className="main">
            <div className="container pt-5">
              <div
                className="col-lg-8 mx-auto"
                style={{ paddingBottom: "200px" }}
              >
                <div className="pt-5">
                  <p className="heading" style={{ fontSize: "32px" }}>
                    Enter Data
                  </p>
                </div>
                <div className="card p-4">
                  <form>
                    <label className="label">Co-Ordinates : </label>

                    <div className="form-group row mt-2">
                      <label className="col-sm-2 col-form-label">
                        X-Axis :
                      </label>
                      <div className="col-sm-3">
                        <input
                          type="email"
                          className="form-control"
                          placeholder="X"
                        />
                      </div>
                      <label className="col-sm-2 col-form-label">
                        Y-Axis :
                      </label>
                      <div className="col-sm-3">
                        <input
                          type="email"
                          className="form-control"
                          placeholder="Y"
                        />
                      </div>
                    </div>
                    <div className="row mt-4">
                      <label className="col-sm-2 label">Type : </label>
                      <div className="col-sm-6 form-group ">
                        <select
                          className="form-control"
                          id="exampleFormControlSelect1"
                        >
                          <option selected disabled>
                            Select
                          </option>
                          <option>Crime</option>
                          <option>Accident</option>
                        </select>
                      </div>
                    </div>
                    <div className="text-right">
                      <button type="button" className="btn btn-primary">
                        Submit
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default AddForm;
