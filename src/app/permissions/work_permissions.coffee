class WorkPermissions extends Permissions
  constructor: (@work, @user) ->

  index: () ->
    @work.public || @work.hasCollaborator(@user)

  create: () ->
    true

  show: () ->
    @user.admin || @index

  update: () ->
    @show

  delete: () ->
    false
