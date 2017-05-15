import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';


const Root = ({ store }) => { //when you leave out class declaration from a function, JSX knows to create React class and render?
  return (
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  );
};

export default Root;
