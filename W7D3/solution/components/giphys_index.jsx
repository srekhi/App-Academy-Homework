import React from 'react';
import GiphyIndexItem from './giphys_index_item';
class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }
  render(){
    let { giphys } = this.props;
    return (
      <ul>
        {giphys.map( (giphy) => <GiphyIndexItem giphy={giphy} />)};
      </ul>
    );
  }

}

export default GiphysIndex;
