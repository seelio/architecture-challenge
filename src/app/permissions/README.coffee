class SomePermissions extends Permissions
  constructor: (@work, @user) ->

  # the instance methods must match the controller methods
  index: () ->
    true

  create: () ->
    false

  show: () ->
    @user.admin || @index

  update: () ->
    @show

  delete: () ->
    false
