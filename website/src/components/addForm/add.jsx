import React, { Component } from "react";
import * as ROUTE from "../../utils/routes";
import "./style.css";
import axios from "axios";

class AddForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      x: "",
      y: "",
      type: ""
    };
    this.onChange = this.onChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit = async e => {
    e.preventDefault();
    console.log(this.state);
    try {
      const token = localStorage.getItem("token");
      await axios.post(
        ROUTE.addData,
        {
          latitude: this.state.x,
          longitude: this.state.y,
          type: this.state.type
        },
        {
          headers: {
            "x-auth-token": token
          }
        }
      );
      window.location = "/dashboard";
    } catch (ex) {
      console.log(ex);
    }
  };

  onChange(e) {
    this.setState({
      [e.target.name]: e.target.value
    });
  }

  render() {
    return (
      <React.Fragment>
        <div className="fluid-container">
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
                  <form onSubmit={this.handleSubmit}>
                    <label className="label">Co-Ordinates : </label>

                    <div className="form-group row mt-2">
                      <label className="col-sm-2 col-form-label">
                        X-Axis :
                      </label>
                      <div className="col-sm-3">
                        <input
                          type="number"
                          name="x"
                          className="form-control"
                          placeholder="X"
                          value={this.state.x}
                          onChange={this.onChange}
                        />
                      </div>
                      <label className="col-sm-2 col-form-label">
                        Y-Axis :
                      </label>
                      <div className="col-sm-3">
                        <input
                          type="number"
                          name="y"
                          className="form-control"
                          placeholder="Y"
                          value={this.state.y}
                          onChange={this.onChange}
                        />
                      </div>
                    </div>
                    <div className="row mt-4">
                      <label className="col-sm-2 label">Type : </label>
                      <div className="col-sm-6 form-group ">
                        <select
                          name="type"
                          className="form-control"
                          id="exampleFormControlSelect1"
                          value={this.state.type}
                          onChange={this.onChange}
                        >
                          <option defaultValue disabled>
                            Select
                          </option>
                          <option value="crime">Crime</option>
                          <option value="accident">Accident</option>
                        </select>
                      </div>
                    </div>
                    <div className="text-right">
                      <button type="submit" className="btn btn-primary">
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
