import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component{
  constructor(props){
    super(props);
    this.state = {};
    this.searchTerm = "";
    this.fetchGiphys = this.fetchGiphys.bind(this);
    this.props.fetchSearchGiphys = this.props.fetchSearchGiphys(this);
  }
  fetchGiphys(event) {
    let searchTerm = event.target.value;
    this.setState({ searchTerm });
    this.props.fetchSearchGiphys(searchTerm);
  }
  render() {
    return (
      <div>
        <input type="text" onChange={this.fetchGiphys}/>
        <button onClick={this.submitText}>Submit</button>
      </div>
    );
  }
}

export default GiphysSearch;
