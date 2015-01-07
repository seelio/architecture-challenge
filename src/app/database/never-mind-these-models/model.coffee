class Model extends Extendable
  # Set @mm to be the correct Mongoose Model to query through

  # Public: Note that this returns mongoose query
  @find: () ->
    args = @constructor.__argumentArray(arguments)
    @constructor.mm.find.apply(@, args).lean()

  @findOne: () ->
    args = @constructor.__argumentArray(arguments)
    @constructor.mm.findOne.apply(@, args).lean()

  constructor: (@query) ->
    @doc = @query.exec()

  save: ->
    @doc.save()
