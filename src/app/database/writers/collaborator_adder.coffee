class CollaboratorAdder extends Collaborator
  constructor: (@work, @collaborator) ->

  call: (done) ->
    collaboratorsToNotify = @work.collaborators

    async.waterfall [
      (next) ->
        mongoose.model.UsersWorks.find(_user: @collaborator).count(next)
      (count, next) ->
        uw = new mongoose.model.UsersWorks
        uw._work = @work._id
        uw._user = @collaborator._id
        uw.order = count # zero index
        uw.save(next)
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
