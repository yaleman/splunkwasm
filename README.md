# splunkwasm

A small Rust-to-WASM library that is loaded and executed by Splunk’s Python runtime via pywasm.

## Prerequisites

- [uv](https://github.com/astral-sh/uv) for Python dependencies and tooling.
- [mise](https://mise.jdx.dev/) for task orchestration.
- [rust](https://rust-lang.org)

## Usage

1. Start Splunk in Docker and wait for it to finish booting:

   ```bash
   scripts/start_splunk.sh
   ```

2. Build, package, and run inside the container:

   ```bash
   mise run_in_docker
   ```

   or

   ```bash
   uv run python scripts/package.py --clean
   scripts/run_in_docker.sh
   ```

`mise run_in_docker` expects the container name `splunkwasm` from `scripts/start_splunk.sh` and will copy the local `package/` directory into `/home/ansible/` in the container before invoking `splunkwasm.__main__`.
