
var path = require('path')

module.exports = {
  entry: path.resolve(__dirname, 'src', 'index.ts'),
  output: {
    filename: 'anime4k.js',
    path: path.resolve(__dirname, 'dist'),
    library: 'Anime4KJS',
    libraryTarget: 'umd',
  },

  resolve: {
    extensions: ['.ts', '.js', '.json', '.glsl']
  },

  devtool: "source-map",

  module: {
    rules: [
      {
        test: /\.ts$/,
        use: [
          { loader: "swc-loader" },
        ],
      }
    ]
  }
}
