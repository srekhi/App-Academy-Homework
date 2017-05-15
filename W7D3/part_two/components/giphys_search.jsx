import React from 'react';
import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {};
    this.state.searchTerm = "";
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event){
    let searchTerm = event.target.value;
    this.setState({searchTerm});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.state.giphys = this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  render(){
    return (
      <div>
        <form>
          <input type="text" value="this.state.searchTerm" onChange={this.handleChange} />
          <button type="submit" onClick={this.handleSubmit}>Submit</button>
          <GiphysIndex />
        </form>
      </div>
    );
  }
}

export default GiphysSearch;
