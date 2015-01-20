```coffee
class SomeService
  constructor: (@foo, @bar) ->
    # this static method can do whatever you want it to
    # generally, pass in instances

  call: (done) ->
    # the only public interface to this class is this method.
    # it only accepts the `done` callback
    #
    # this allows for chained services

  _privateMethods: () ->
    # create as many private methods as you please
```
