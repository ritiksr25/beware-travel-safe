import React, { Component } from "react";
//import { Link } from "react-router-dom";
import axios from "axios";
import * as ROUTES from "../../utils/routes";
class Dashboard extends Component {
  state = {
    data: ""
  };

  async componentDidMount() {
    const token = localStorage.getItem("token");
    const { data } = await axios.get(ROUTES.dashData, {
      headers: {
        "x-auth-token": token
      }
    });
    this.setState({ data: data });
  }
  render() {
    const data = this.state.data.data;
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
                    Dashboard
                  </p>
                </div>
                <div className="card p-4">
                  <table className="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">S.No.</th>
                        <th scope="col">X-axis</th>
                        <th scope="col">Y-axis</th>
                        <th scope="col">Type</th>
                      </tr>
                    </thead>
                    <tbody>
                      {data
                        ? data.map((item, i) => (
                            <tr key={i}>
                              <th scope="row">{i + 1}</th>
                              <td>{item.latitude}</td>
                              <td>{item.longitude}</td>
                              <td>{item.type}</td>
                            </tr>
                          ))
                        : null}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Dashboard;
