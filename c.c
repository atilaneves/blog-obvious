double add2(const double* values, const long length) {
    double ret = 0.0;
    for(long i = 0; i < length; ++i) {
        ret += values[i] * values[i];
    }
    return ret;
}
