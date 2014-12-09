# Design Challenge

Design a controller method that will add a collaborator to a work. The controller method must:

- [x] Add a collaborator to work
- [x] Verify that the current user has permission to add a collaborator to the work in question
- [ ] Persist the collaborator to the database by:
  - [ ] Adding a collaborator entry to the work in the database
  - [ ] Adding a work entry to the new collaborator’s student record
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

## Notes

- try/catch is an antipattern, but since it's not user code, I think it's fine. There is one possible source of thrown errors (permissions, two if 404s are thrown into the mix, but regardless it all comes from the check method), and the only public point of entry is the Controller.call, and call takes care of the try/catch.
  - It would be possible to just do if else stuff, but this is a lot neater to me
