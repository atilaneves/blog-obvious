#if ALGORITHM
#include <algorithm>
#include <numeric>
#endif


extern "C" double add2(const double* values, const long length) {
    #if LOOP
    double ret = 0.0;
    for(long i = 0; i < length; ++i) {
        ret += values[i] * values[i];
    }
    return ret;
    #elif ALGORITHM
    return std::accumulate(values, values + length, 0.0, [](double a, double v) { return a + v * v; });
    #else
    static_assert(false);
    #endif
}
