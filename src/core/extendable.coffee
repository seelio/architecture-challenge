class Extendable
  @__argumentArray: (args) ->
    Array.prototype.slice.call(args)

  @__instantiateGivenArray: (args) ->
    argArray = [null].concat(args)
    new (@.bind.apply(@, argArray))

  @__instantiateGivenArgs: ->
    args = @__argumentArray(arguments)
    @__instantiateGivenArray(args)
