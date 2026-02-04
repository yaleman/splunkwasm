# Repository Guidelines

## Project Structure & Module Organization

- `src/` contains the Rust library source (entry point: `src/lib.rs`).
- `splunkwasm/` is the Python package namespace (currently minimal scaffolding).
- `tests/` holds Python tests (e.g., `tests/test_splunkwasm.py`).
- `target/` is the Rust build output directory (generated).
- `Cargo.toml` and `pyproject.toml` define Rust and Python metadata.
- `mise.toml` provides task shortcuts for common workflows.

## Build, Test, and Development Commands

- `cargo build --target wasm32-unknown-unknown` builds the WASM library (the only supported target).
- `mise run wasm_build` builds the WASM artifact using the repo task.
- `cargo fmt --all` formats Rust code (and `cargo fmt --all --check` verifies).
- `mise run clippy` runs Rust linting.
- `mise run pytest` runs Python tests (loads the built `.wasm` via pywasm).
- `mise run ruff` runs the Python linter.
- `mise run python_typing` runs Python type checks.
- `mise run test` runs the WASM build and Python tests.
- `mise run lint` executes clippy, ruff, and Python type checks.

## Coding Style & Naming Conventions

- Rust formatting is enforced by `rustfmt`; follow default Rust 2024 edition style.
- Prefer `snake_case` for Rust functions and Python modules; `CamelCase` for Rust types.
- Python code should be type-annotated to satisfy `mypy --strict` and `ty`.

## Testing Guidelines

- The Rust test harness is disabled; tests run through Python using pywasm.
- Python tests use `pytest` in `tests/` and should follow `test_*.py` / `test_*` naming.
- Ensure the WASM artifact is built before running tests (`mise run test` does this).

## Commit & Pull Request Guidelines

- Git history currently contains a single “initial commit,” so no convention is established.
- Use short, imperative commit messages (e.g., “Add wasm export helpers”).
- PRs should include a clear summary, testing notes, and any relevant issue links.

## Configuration & Tooling Notes

- Python version is `==3.13` (see `.python-version` / `pyproject.toml`).
- Use `mise` tasks from `mise.toml` for consistent local workflows.
