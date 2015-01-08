class CollaboratorsController extends Controller
  @permissions = 'collaborator'

  create: ->
    work = Work.find()
    actingUser = User.find()
    userToBeInvited = User.find()

    @check(work, actingUser)

    ca = new CollaboratorAdder(work, userToBeInvited)

    ca.call (err) ->
      @respond
        html:
          flash: "You invited the person yay"
          redirect: router.link(work)
        json:
          work: work
          inviter: actingUser
          invitee: user
