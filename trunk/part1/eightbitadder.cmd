| eightbitadder.cmd

analyzer A[{0:7}] B[{0:7}] Cin Sum[{0:7}] Cout
vector A A[{7:0}]
vector B B[{7:0}]
vector C Cin

set A 00000000
set B 00000000
set C 0
s

set A 00000000
set B 00000000
set C 1
s

set A 11111111
set B 00000000
set C 1
s
s
s
