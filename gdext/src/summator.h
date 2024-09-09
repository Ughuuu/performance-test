//© Copyright 2014-2022, Juan Linietsky, Ariel Manzur and the Godot community (CC-BY 3.0)
#ifndef SUMMATOR_CLASS_H
#define SUMMATOR_CLASS_H

// We don't need windows.h in this plugin but many others do and it throws up on itself all the time
// So best to include it and make sure CI warns us when we use something Microsoft took for their own goals....
#ifdef WIN32
#include <windows.h>
#endif

#include <godot_cpp/classes/ref.hpp>

using namespace godot;

class Summator : public RefCounted
{
    GDCLASS(Summator, RefCounted);

    int count;
    Callable callable;
    Array array = Array();

protected:
    static void _bind_methods();

public:
    Summator();
    ~Summator();

    void set_callable(Callable callable);
    void call_callable();
    void add(int p_value);
    void noop();
    void reset();
    int get_total() const;
};

#endif // SUMMATOR_CLASS_H