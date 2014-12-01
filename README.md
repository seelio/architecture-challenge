Design a controller method that will add a collaborator to a work. The controller method must:

- [ ] Verify that the current user has permission to add a collaborator to the work in question
- [ ] Persist the collaborator to the database by:
  - [ ] Adding a collaborator entry to the work in the database
  - [ ] Adding a work entry to the new collaborator’s student record
- [ ] Log the adding of the collaborator for analytics purposes
- [ ] Send an email to the new collaborator’s email address
- [ ] Notify the new collaborator in Seelio
- [ ] Notify current collaborators on the work that there is a new collaborator
  - [ ] This must except the adder and the new collaborator themselves
- [ ] Respond by calling a callback with success information about:
  - [ ] The work
  - [ ] The adder
  - [ ] The user added
- [ ] Be easily testable (i.e, you will have to demonstrate how the tests will be written for the components that are built that are deemed “important”)
