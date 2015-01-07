# Plural because many-to-many
module.exports =
  _user: mongoose.Schema.ObjectId
  _work: mongoose.Schema.ObjectId
  order: Number
  owner: Boolean
