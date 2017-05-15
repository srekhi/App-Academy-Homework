import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import {applyMiddleware} from 'redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
  let dispatchFunc = store.dispatch;
  console.log(store.getState());
  console.log(action);
  dispatchFunc(action);
  next(action);
  console.log(store.getState());
};

export default configureStore;
