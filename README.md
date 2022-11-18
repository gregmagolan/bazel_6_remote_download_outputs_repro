Repro of issue with Bazel 6, --remote_download_outputs=toplevel, remote_cache (or diisk_cache), directory_artifacts and sandboxed execution

Conditions for issue:

- bazel 6.0.0rc1 or rc2
- a directory artifact in runfiles (created with  ctx.actions.declare_directory`)
- sandboxed execution
- `--remote_cache` (or `--disk_cache` enabled)
- `--remote_download_outputs=toplevel` (or `minimal`)

Issue:

The output directory is not present in the sandbox.

Run `./repro.sh` to run a test that fails if the directory artifact is not present in runfiles. Removing the `--remote_download_outputs` flag -or- running with `--spawn_strategy=local` makes the test pass.
