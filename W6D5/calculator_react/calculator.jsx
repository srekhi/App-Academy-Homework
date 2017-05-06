import React from 'react';

class Calculator extends React.Component{
  constructor(props, num1 = "", num2 = ""){
    super(props);
    this.state = {
      num1: "",
      num2: "",
      result: 0
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.reset = this.reset.bind(this);

  }

  setNum1(e) {
    let input = e.currentTarget;
    let num1 =
    this.setState( {num1: parseInt(input.value) });
  }

  setNum2(e) {
    let input = e.currentTarget;
    this.setState( {num2: parseInt(input.value) });
  }

  add(e) {
    e.preventDefault();
    let num1 = this.state.num1;
    let num2 = this.state.num2;
    let result = num1 + num2;
    this.setState({result});
  }

  subtract(e) {
    e.preventDefault();
    let num1 = this.state.num1;
    let num2 = this.state.num2;
    let result = num1 - num2;
    this.setState( {result} );
  }

  reset(e) {
    e.preventDefault();
    let num1 = "";
    let num2 = "";
    this.setState( {num1, num2, result: 0});
  }


  render(){ //return value must be a single el
    const { num1, num2, result  } = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum1} placeholder={num1}></input>
        <input type="text" onChange={this.setNum2} placeholder={num2}></input>

        <button onClick={this.add}>Add</button>
        <button onClick={this.subtract}>Subtract</button>
        <button onClick={this.reset}>reset</button>
      </div>
    );
  }
}

export default Calculator;
