import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';
import merge from 'lodash/merge';

export const GiphysReducer = (oldState = [], action) => { //slice of state here is just the giphys
  switch(action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      let newState = [].concat(oldState);
      return newState.concat(action.giphys);
    default:
      return oldState;
  }
};
