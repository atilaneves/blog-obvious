all: c d-loop d-algorithm cpp-loop cpp-algorithm

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

bench.o: bench.d
	ldc2 -c -O2 $^ -of $@
