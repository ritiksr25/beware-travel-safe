import React, { Component } from "react";

class Form extends Component {
  state = {
    data: {}
  };

  handleChange = ({ currentTarget: input }) => {
    const data = { ...this.state.data };
    data[input.name] = input.value;
    this.setState({ data });
  };

  handleSumbit = e => {
    e.preventDefault();
    this.doSubmit();
  };

  renderInput(name, type, placeholder) {
    const { data } = this.state;
    return (
      <input
        type={type}
        className="form-control"
        placeholder={placeholder}
        value={data[name]}
        onChange={this.handleChange}
      />
    );
  }
}

export default Form;
