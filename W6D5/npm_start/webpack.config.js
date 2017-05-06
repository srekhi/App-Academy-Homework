const path = require('path'); //path module

module.exports = {
  entry: "./entry.jsx",
  output: "bundle.js",
  devtool: 'source-map',
  module: {
    loaders: [
      {
        test: [/\.jsx?$/], //specifies the babel file type we're trying to transpile.
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  }
};
