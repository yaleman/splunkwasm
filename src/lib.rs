#[cfg(not(target_arch = "wasm32"))]
compile_error!(
    "splunkwasm only supports the wasm32 target. Use: cargo build --target wasm32-unknown-unknown"
);

#[unsafe(no_mangle)]
pub extern "C" fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[unsafe(no_mangle)]
pub extern "C" fn multiply(left: u64, right: u64) -> u64 {
    left * right
}
