schema = new mongoose.Schema(require "../schemas/user")

modules.export = mongoose.model("User", schema)
