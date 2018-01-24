import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      term: '',
    };
  }

  handleSubmit(e) {
    e.preventDefault();


    console.log(this.props.fetchSearchGiphys(this.state.term));
  }

  handleChange(e) {
    this.setState({ term: e.target.value });
  }

  render() {
    return (
      <div>
        <form onSubmit={(e) => this.handleSubmit(e)}>
          <input onChange={e => this.handleChange(e)} type="text" value={this.state.term} />
          <input type="submit" value="Search"></input>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }

}

export default GiphysSearch;