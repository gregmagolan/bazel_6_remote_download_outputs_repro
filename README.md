# Repro of Bazel 6 issue https://github.com/bazelbuild/bazel/issues/16789

With `--remote_download_outputs=toplevel` (or `minimal`), `remote_cache` (or `disk_cache`) & sandboxed execution, directory artifacts
are not present in runfiles in the sandbox.
## Conditions for issue

- Bazel 6.0.0rc1 or rc2
- directory artifact (created with  ctx.actions.declare_directory`) in runfiles of a test or binary target
- sandboxed execution
- `--remote_cache` (or `--disk_cache` enabled)
- `--remote_download_outputs=toplevel` (or `minimal`)

## Issue

The output directory is not present in the sandbox when the test or binary target is run.

## Run repro

Run `./repro.sh` to run a test that fails if the directory artifact is not present in runfiles. Removing the `--remote_download_outputs` flag -or- running with `--spawn_strategy=local` makes the test pass.
