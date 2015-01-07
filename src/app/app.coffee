app = express()
router = new Router(app)

# Nested routes

router.resource
  '/works': WorksController
  '/collaborators': CollaboratorController

# That's just a shortcut for:
# 
# app.get    '/works',            WorksController.call("index")
# app.get    '/works/new',        WorksController.call("new")
# app.post   '/works',            WorksController.call("create")
# app.get    '/works/:work',      WorksController.call("show")
# app.get    '/works/:work/edit', WorksController.call("edit")
# app.post   '/works/:work',      WorksController.call("update")
# app.delete '/works/:work',      WorksController.call("destroy")
# 
# app.get    '/works/:work/collaborators',                    CollaboratorController.call("index")
# app.get    '/works/:work/collaborators/new',                CollaboratorController.call("new")
# app.post   '/works/:work/collaborators',                    CollaboratorController.call("create")
# app.get    '/works/:work/collaborators/:collaborator',      CollaboratorController.call("show")
# app.get    '/works/:work/collaborators/:collaborator/edit', CollaboratorController.call("edit")
# app.post   '/works/:work/collaborators/:collaborator',      CollaboratorController.call("update")
# app.delete '/works/:work/collaborators/:collaborator',      CollaboratorController.call("destroy")
