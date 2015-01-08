class Router
  constructor: (@app) ->

  resource: () ->
    args = Array.prototype.slice.call(arguments)

    # blah blah blah

  get: ->
    @app.get

  post: ->
    @app.post

  delete: ->
    @app.delete

module.exports = Router
