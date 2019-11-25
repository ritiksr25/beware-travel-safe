import React, { Component } from "react";

class Dashboard extends Component {
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
                    <a className="nav-link " href="#">
                      Add Data
                    </a>
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
                    Dashboard
                  </p>
                </div>
                <div className="card p-4">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">S.No.</th>
                        <th scope="col">X-axis</th>
                        <th scope="col">Y-axis</th>
                        <th scope="col">Type</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>343.434</td>
                        <td>343.545</td>
                        <td>Gaadi ka tel khtm ho gya</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>265.254</td>
                        <td>25.25614</td>
                        <td>Gaadi puncture</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>48</td>
                        <td>564.2545</td>
                        <td>neend aa gyi chalate hue</td>
                      </tr>
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
