class Collaborator  
  _sendNotificationsToExisting: (collaboratorsToNotify, done) ->
    collaboratorsToNotify.each (collaborator) ->
      new Notification(collaborator)

    done()

  _sendNotificationsToNew: (done) ->
    new Notification(@collaborator)

    done()

  _sendEmailToExisting: (collaboratorsToNotify, done) ->
    collaboratorsToNotify.each (collaborator) ->
      # deliver email via job queue

  _sendEmailToNew: (done) ->
    # deliver email to @collaborator via job queue
