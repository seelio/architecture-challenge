class Controller
  constructor: (@action, @req, @res) ->
    permissionsPath = "../permissions/#{@constructor.permissions}_permissions"

    @permissions = new (require permissionsPath)

  respond: (locals) ->
    @assertPermissionsChecked() if @assertPermissions

    @res.render()

  check: () ->
    args = Array.prototype.slice.call(arguments, 0)

    if !@permissions[@action](args)
      throw new Error("Access denied")

  assertPermissionsChecked: () ->
    # throw Error
    # this is for development purposes

  run: () ->
    try
      @[@action]()
    catch e
      @res.render("403")

  @call: (action) ->
    (req, res) =>
      instance = new @(action, req, res)
      instance.run()
