```coffee
class SomeController extends Controller
  # This static class variable part of the path to the permissions file
  @permissions = 'foo'

  @assertPermissions = true

  # These methods should only be called using the static method Controller.call
  index: () ->
  new: () ->
  create: () ->
  show: () ->
  edit: () ->
  update: () ->
  destroy: () ->
```
