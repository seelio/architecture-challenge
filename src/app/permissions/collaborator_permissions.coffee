class CollaboratorPermissions extends Permissions
  constructor: (@work, @user) ->

  index: () ->
    @work.public || @work.hasCollaborator(@user)

  create: () ->
    @work.hasCollaborator(@user)

  show: () ->
    @index

  update: () ->
    @work.hasCollaborator(@user)

  delete: () ->
    @work.hasCollaborator(@user)
