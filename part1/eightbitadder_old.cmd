| eightbitadder.cmd

analyzer A[{0:7}] B[{0:7}] Cin Sum[{0:7}] Cout
vector A A[{7:0}]
vector B B[{7:0}]
vector C Cin

set A 00000001
set B 00000001
set C 1
s

set A 00000011
set B 00000001
set C 1
s

set A 00000100
set B 00000100
set C 0
s

set A 00000101
set B 00001001
set C 0
s

set A 00010001
set B 00000101
set C 1
s

set A 01100001
set B 00001101
set C 1
s

set A 00000001
set B 00100001
set C 0
s

set A 01100001
set B 00001001
set C 0
s

set A 10000000
set B 01000000
set C 0
s

set A 01100000
set B 10000000
set C 0
s

set A 11000000
set B 10000000
set C 0
s

set A 00100000
set B 11000000
set C 1
s
