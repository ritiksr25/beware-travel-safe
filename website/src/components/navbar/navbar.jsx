import React from "react";
import { Link } from "react-router-dom";

const Navbar = ({ user }) => {
  return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light">
      <div className="container">
        <Link
          className="navbar-brand tag text-left"
          style={{
            fontWeight: "700",
            color: "#7B65E4",
            fontSize: "22px"
          }}
          to="#"
        >
          Travel Safe
        </Link>
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

        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul
            className="navbar-nav mr-auto nav justify-content-end custom_nav"
            style={{ width: "100%" }}
          >
            {user ? (
              <React.Fragment>
                {/* <li className="nav-item">
                  <Link className="nav-link " to="/">
                    {user.toUpperCase()}
                  </Link>
                </li> */}
                <li className="nav-item">
                  <Link className="nav-link " to="/dashboard">
                    Dashboard
                  </Link>
                </li>
                <li className="nav-item">
                  <Link className="nav-link " to="/add">
                    Add Data
                  </Link>
                </li>
                <li className="nav-item">
                  <Link className="nav-link " to="/logout">
                    Log Out
                  </Link>
                </li>
              </React.Fragment>
            ) : (
              <li className="nav-item">
                <Link className="nav-link " to="#">
                  About Us
                </Link>
              </li>
            )}
          </ul>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
