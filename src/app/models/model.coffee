class Model
  @find: () ->
    @constructor.mm.find().lean()

  @findOne: () ->
    @constructor.mm.findOne().lean()

  constructor: (@query) ->
    @doc = @query.exec()
