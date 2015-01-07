class CollaboratorsController extends Controller
  @permissions = 'collaborator'

  create: ->
    work = Work.find()
    actingUser = User.find()
    userToBeInvited = User.find()

    @check(work, actingUser)

    ca = new CollaboratorAdder(work, userToBeInvited)

    ca.call (err) ->
      @respond(redirect: router.link(work))
      @respondJson()
