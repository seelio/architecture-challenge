class CollaboratorAdder extends Collaborator
  constructor: (@work, @collaborator) ->

  call: (done) ->
    collaboratorsToNotify = @work.collaborators

    async.series [
      (next) ->
        @work.addCollaborator(@collaborator, next)
      (next) ->
        logger.notice(@collaborator)
      (next) ->
        @_sendNotificationsToExisting(collaboratorsToNotify, next)
      (next) ->
        @_sendEmailToExisting(collaboratorsToNotify, next)
      (next) ->
        @_sendNotificationsToNew(next)
      (next) ->
        @_sendEmailToNew(next)
    ], done
