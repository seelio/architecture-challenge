class Controller extends Extendable
  # Internal:
  constructor: (@action, @req, @res) ->
    @permissionsPath = "../permissions/#{@constructor.permissions}_permissions"

    # Automatically check permissions
    @permissionsArgs      = null
    @permissionsChecked   = false
    @permissionsAutoCheck = false
    @authorize            = ["index", "show", "new", "create", "edit", "update", "destroy"]

  # Public:
  respond: (locals) ->
    @res.render()
    # or other stuff

  # Public:
  respondJson: (locals) ->
    @res.json(locals)

  # Internal
  _respond: ->
    switch requesttype
    when "json"
      respond with json
    else
      respond with html



  # Public:
  check: () ->
    args = Array.prototype.slice.call(arguments, 0)

    permissionsClass     = require permissionsPath
    permissions          = new @permissionsClass(args)

    unless permissions[@action]()
      throw new AccessDenied("Access denied")

    @permissionsChecked = true

  # Internal:
  _assertPermissionsChecked: () ->
    unless @permissionsChecked
      throw new UncheckedPermissionError("permissions was not checked for #{@action}")

  # Internal: Highest-level internal method
  _run: () ->
    try
      # Run the action
      @[@action]()

      # Ensure that permissions have been run in the action method
      @_assertPermissionsChecked() if @assertPermissions
    catch e
      process.nextTick ->
        @res.render("403")

  # Public: Only public interface to controller
  # Returns method to be run by express router
  @call: (action) ->
    (req, res) =>
      instance = new @(action, req, res)
      instance._run()
      instance._respond()
