import std.datetime.stopwatch: StopWatch, AutoStart;
import std.datetime: Duration, hours;
import std.random;
import std.stdio;
import std.algorithm;

enum NUM_RUNS = 10;

extern(C) double add2(const double* values, const long length);

void main() {
    const length = 32_000_000;
    auto values = new double[length];
    auto rnd = Random(1337);
    foreach(i; 0 .. length)
        values[i] = uniform01(rnd);

    Duration dur = 24.hours;

    foreach(i; 0 .. NUM_RUNS) {
        write(i, " ");
        stdout.flush;
        auto sw = StopWatch(AutoStart.yes);
        add2(values.ptr, length);
        dur = min(dur, cast(Duration) sw.peek);
    }

    writeln;
    writeln("The minimum run was ", dur);
}
