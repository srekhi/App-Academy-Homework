import React from 'react';


class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let {giphy} = this.props;
    return <img src ={giphy.data.url} />
  }
}
