import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

const store = configureStore();

document.addEventListener("DOMContentLoaded", () => {
  let hook = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, hook);
});
