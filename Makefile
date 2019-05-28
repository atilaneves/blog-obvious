all: c d-loop d-algorithm cpp-loop cpp-algorithm rs-loop rs-algorithm

c: c.o bench.o
	ldc2 $^ -of $@

c.o: c.c
	clang -c -O2 -o $@ $^

cpp-loop: cpp-loop.o bench.o
	ldc2 $^ -of $@

cpp-loop.o: cpp.cpp
	clang++ -DLOOP=1 -c -O2 -o $@ $^

cpp-algorithm: cpp-algorithm.o bench.o
	ldc2 $^ -of $@

cpp-algorithm.o: cpp.cpp
	clang++ -DALGORITHM=1 -c -O2 -o $@ $^

d-loop: d.d bench.o
	ldc2 -d-version=loop -O2 $^ -of $@

d-algorithm: d.d bench.o
	ldc2 -d-version=algorithm -O2 $^ -of $@

rs-loop: rs-loop.o bench.o
	ldc2 $^ -of $@ ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/libstd-296aebc3a1e4ecfc.so

rs-loop.o: rs.rs Makefile
	rustc --cfg _loop -C opt-level=2 --crate-type=lib --emit=obj rs.rs -o $@

rs-algorithm: rs-algorithm.o bench.o
	ldc2 $^ -of $@ ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/libstd-296aebc3a1e4ecfc.so

rs-algorithm.o: rs.rs Makefile
	rustc --cfg algorithm -C opt-level=2 --crate-type=lib --emit=obj rs.rs -o $@

bench.o: bench.d
	ldc2 -c -O2 $^ -of $@
