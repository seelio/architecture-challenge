async = require("async")
fs = require("fs")
path = require("path")

getAllFiles = (relativePath, iterator) ->
  directoryToRead = path.resolve(__dirname, relativePath)

  fs.readDirSync directoryToRead, (err, files) ->
    throw new Error("error loading #{directoryToRead}") if err?

    files.forEach(iterator)


getAllFiles "metal", (filePath) ->
  globals[filePath] = require(filePath)


getAllFiles "errors", (filePath) ->
  globals[filePath] = require(filePath)


getAllFiles "components", (filePath) ->
  globals.SEE[filePath] = require(filePath)


getAllFiles "base", (filePath) ->
  globals[filePath] = require(filePath)
