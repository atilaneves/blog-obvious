extern(C) double add2(double* values, long length) {
    version(loop) {
        double ret = 0.0;
        foreach(i; 0 .. length) {
            ret += values[i] * values[i];
        }

        return ret;
    } else version(algorithm) {
        import std.algorithm: fold;
        return values[0 .. length].fold!((a, b) => a + b * b);
    } else {
        static assert(false);
    }
}


auto add2(double[] values) {
    return add2(values.ptr, values.length);
}

unittest {
    import std.conv: text;
    auto values = [1.0, 2.0];
    const ret = add2(values);
    assert(ret == 5.0, ret.text);
}
