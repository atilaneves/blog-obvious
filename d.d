extern(C) double add2(double* values, long length) {
    version(loop) {
        double ret;
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
