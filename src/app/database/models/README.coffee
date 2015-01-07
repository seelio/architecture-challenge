class SomeModel extends Model
  # Set @mm to be the correct Mongoose Model to query through
  @mm = mongoose.models.Some

  constructor: (@query) ->
    @doc = @query.exec()
