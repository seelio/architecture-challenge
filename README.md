# Architecture Challenge

My goals are primarily to:

- keep the code OOP
- keep things "declarative"

Much of my focus was on implementation on the framework which underlies the application.

## The checklist

Design a controller method that will add a collaborator to a work. The controller method must:

- [x] Add a collaborator to work
- [x] Verify that the current user has permission to add a collaborator to the work in question
- [x] Persist the collaborator to the database by:
  - [x] Adding a collaborator entry to the work in the database
  - [x] Adding a work entry to the new collaborator’s student record
- [x] Log the adding of the collaborator for analytics purposes
- [x] Send an email to the new collaborator’s email address
- [x] Notify the new collaborator in Seelio
- [x] Notify current collaborators on the work that there is a new collaborator
  - [x] This must except the adder and the new collaborator themselves
- [ ] Respond by calling a callback with success information about:
  - [ ] The work
  - [ ] The adder
  - [ ] The user added
- [ ] Be easily testable (i.e, you will have to demonstrate how the tests will be written for the components that are built that are deemed “important”)
