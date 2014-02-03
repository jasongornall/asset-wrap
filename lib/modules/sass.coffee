
# dependencies
fs = require 'fs'
path = require 'path'
nib = require 'nib'
sass = require 'sass'
Asset = require('../asset').Asset

# asset
class exports.SassAsset extends Asset
  ext: 'css'
  name: 'sass'
  type: 'text/css'
  compile: ->
    fs.readFile @src, 'utf8', (err, data) =>
      return @emit 'error', err if err?
      @data = sass.render data
      @emit 'compiled'
