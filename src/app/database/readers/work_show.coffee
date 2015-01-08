class WorkShow
  constructor: (_work) ->
    @workQuery = models.Work.findById(_work).lean()

  call: (err, work) ->
    work = @workQuery.exec()
