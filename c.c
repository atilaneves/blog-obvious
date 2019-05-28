double add2(double* values, long length) {
    double ret = 0.0;
    for(long i = 0; i < length; ++i) {
        ret += values[i] * values[i];
    }
    return ret;
}
