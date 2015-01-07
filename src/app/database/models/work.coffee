schema = new mongoose.Schema(require "../schemas/work")

modules.export = mongoose.model("Work", schema)
