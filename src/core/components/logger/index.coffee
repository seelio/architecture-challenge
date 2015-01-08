# singleton logger class
class Logger
  notice: (msg) ->
  warn: (msg) ->
  err: (msg) ->

module.exports = new Logger
