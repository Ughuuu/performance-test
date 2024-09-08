cd rust
cargo build --release
cp target/release/libgodot_performance.dylib ../godot/addons/godot-performance-rust/bin/libgodot_performance_rust.macos.framework/libgodot_performance_rust.macos.dylib

