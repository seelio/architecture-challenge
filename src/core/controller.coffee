class Controller extends Extendable
  # Internal:
  constructor: (@action, @req, @res) ->
    @permissionsPath = "../permissions/#{@constructor.permissions}_permissions"

    # Automatically check permissions
    @permissionsArgs      = null
    @permissionsChecked   = false
    @permissionsAutoCheck = false
    @authorize            = ["index", "show", "new", "create", "edit", "update", "destroy"]

  # Internal:
  respond: (locals) ->
    @res.render()

  # Internal:
  check: () ->
    args = Array.prototype.slice.call(arguments, 0)

    permissionsClass     = require permissionsPath
    permissions          = new @permissionsClass(args)

    unless permissions[@action]()
      throw new AccessDenied("Access denied")

    @permissionsChecked = true

  # Internal:
  assertPermissionsChecked: () ->
    unless @permissionsChecked
      throw new UncheckedPermissionError("permissions was not checked for #{@action}")

  # Internal: Highest-level internal method
  run: () ->
    try
      # Run the action
      @[@action]()

      # Ensure that permissions have been run in the action method
      @assertPermissionsChecked() if @assertPermissions
    catch e
      process.nextTick ->
        @res.render("403")

  # Public: Only public interface to controller
  # Returns method to be run by express router
  @call: (action) ->
    (req, res) =>
      instance = new @(action, req, res)
      instance.run()
