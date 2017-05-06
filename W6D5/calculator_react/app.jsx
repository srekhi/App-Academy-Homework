import React from 'react';
import ReactDOM from 'react-dom';
import Calculator from './calculator';

document.addEventListener('DOMContentLoaded', function () {
  const main = document.getElementById("main");
  ReactDOM.render(<Calculator />, main); //grabs the main component, renders calculator 
});
