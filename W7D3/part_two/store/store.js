import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';


const configureStore = () => {
  return createStore(RootReducer, applyMiddleware(thunk)); //apply thunk middleware in order to dispatch async functions
};


export default configureStore;
