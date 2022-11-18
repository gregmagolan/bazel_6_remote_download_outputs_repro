# Some custom rule that outputs a directory artifact

def _impl(ctx):
  out = ctx.actions.declare_directory(ctx.label.name)
  ctx.actions.run_shell(
    outputs = [out],
    command = "echo '1' > {out}/my_file".format(out = out.path),
  )
  return DefaultInfo(
    files = depset([out]),
    runfiles = ctx.runfiles(files = [out])
  )

my_rule = rule(
  implementation = _impl,
  attrs = {},
)