// RUN: %clang_cc1 -debug-info-kind=limited -emit-llvm -o %t %s
// RUN: grep 'noinline' %t

void t1() __attribute__((noinline));

void t1()
{
}

