import os
import pywasm

RUNTIME = pywasm.core.Runtime()
WASM_INSTANCE = RUNTIME.instance_from_file(
    os.path.join(os.path.dirname(__file__), "splunkwasm.wasm")
)


def add(a: int, b: int) -> int:
    """runs add in wasm"""
    return int(RUNTIME.invocate(WASM_INSTANCE, "add", [a, b])[0])


def multiply(a: int, b: int) -> int:
    """runs multiply in wasm"""
    return int(RUNTIME.invocate(WASM_INSTANCE, "multiply", [a, b])[0])
