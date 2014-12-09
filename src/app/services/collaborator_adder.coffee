class CollaboratorAdder
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

  _sendNotificationsToExisting: (collaboratorsToNotify, done) ->
    collaboratorsToNotify.each (collaborator) ->
      new Notification(collaborator)

  _sendNotificationsToNew: (done) ->
    new Notification(@collaborator)

  _sendEmailToExisting: (collaboratorsToNotify, done) ->
    collaboratorsToNotify.each (collaborator) ->
      # deliver email via job queue

  _sendEmailToNew: (done) ->
    # deliver email to @collaborator via job queue
