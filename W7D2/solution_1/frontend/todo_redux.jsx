import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
//soln to part 1
// const addLoggingToDispatch = (store) => {
//  let dispatchFunc = store.dispatch; //grab the dispatch function.
//  return function(action) {
//    console.log(store.getState());
//    console.log(action);
//    dispatchFunc(action); //run it here after logging.
//    console.log(store.getState());
//  };
// };

// const addLoggingToDispatch = store => next => action => {
//   let dispatchFunc = store.dispatch;
//   console.log(store.getState());
//   console.log(action);
//   dispatchFunc(action);
//   next(action);
//   console.log(store.getState());
// };

// const applyMiddleWares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch =  middleware(store)(dispatch); //for each middleware, we
//   });
//   return Object.assign({}, store, { dispatch });
// };





document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  //this function call returns a function to dispatch.
  //when dispatch is now invoked, it will do the addLoggingToDispatch.
  //Makes sense.
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
