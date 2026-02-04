#!/usr/bin/env python3
from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Install splunkwasm and its dependencies into a local package directory."
    )
    parser.add_argument(
        "--package-dir",
        default="package",
        help="Directory to install into (default: package).",
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Remove the package directory before installing.",
    )
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parents[1]
    package_dir = (repo_root / args.package_dir).resolve()

    if args.clean and package_dir.exists():
        shutil.rmtree(package_dir)
    package_dir.mkdir(parents=True, exist_ok=True)

    cmd = [
        sys.executable,
        "-m",
        "pip",
        "install",
        "--upgrade",
        "--target",
        str(package_dir),
        str(repo_root),
    ]
    print(f"running: {' '.join(cmd)}")
    subprocess.run(cmd, check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
