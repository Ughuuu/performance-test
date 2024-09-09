#![feature(panic_always_abort)]
use godot::prelude::*;
use std::panic;
#[derive(GodotClass)]
#[class(base=Object, init)]
pub struct RustPerformanceTestExtensionLibrary {}
#[gdextension]
unsafe impl ExtensionLibrary for RustPerformanceTestExtensionLibrary {
}

#[derive(GodotClass)]
#[class(base=Node2D)]
pub struct PerformanceTestNodeRust {
    array: Array<Variant>,
    callable: Option<Callable>,
    base: Base<Node2D>,
}
#[godot_api]
impl INode2D for PerformanceTestNodeRust {
    fn init(base: Base<Node2D>) -> Self {
        Self {
            array: array![],
            callable: None,
            base
        }
    }
}
#[godot_api]
impl PerformanceTestNodeRust {
    #[func]
    fn noop() {
    }
    #[func]
    fn panic_func() {
        panic!("123");
    }

    #[func]
    fn noop_binded(&self){
    }

    #[func]
    fn set_callable(&mut self, callable: Callable) {
        self.callable = Some(callable);

    }

    #[func]
    fn call(&self) {
        self.callable.as_ref().unwrap().callv(self.array.clone());
    }
}
