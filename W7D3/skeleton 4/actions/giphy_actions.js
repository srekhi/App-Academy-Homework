import * as APIUtil from '../util/api_util';
export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS'; //being exported and defined here to use on type.
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

export const fetchSearchGiphys = (search) => (dispatch) => {
  APIUtil.fetchSearchGiphys(search).then((giphys) => dispatch(receiveSearchGiphys(giphys)));
};

export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  };
};