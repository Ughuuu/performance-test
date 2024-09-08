# Performance test
This repo aims to measure performance between Godot-Rust, GDExtension and GDScript.

GDExtension is able to do about 4x calls to a function than GDScript and Godot Rust.
Godot Rust performs about as good as GDScript, a bit better.

For the test, I am doing a function call inside a _process() call and measuring fps.

for GDExtension with 1000000 (1 million) calls to a Noop function, I get 40 fps.
for Godot Rust with 1 million unbinded calls I get 15 fps
for Godot Rust with 1 million binded calls I get 11 fps
for GDScript with 1 million noop calls I get 9 fps

# Build

Right now there are scripts to build in `scripts` folder (for macOS). After building you can open `godot` folder and open the project there and run test scene. Comment/uncomment these lines:

```
#summator_node.add(1)
#test_node.noop()
#PerformanceTestNodeRust.noop()
noop()
```
