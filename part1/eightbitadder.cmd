| eightbitadder.cmd

analyzer A0 A1 A2 A3 A4 A5 A6 A7 B0 B1 B2 B3 B4 B5 B6 B7 Sum Sum0 Sum1 Sum2 Sum3 Sum4 Sum5 Sum6 Sum7 Cin Cout
vector A A0 A1 A2 A3 A4 A5 A6 A7
vector B B0 B1 B2 B3 B4 B5 B6 B7
vector Sum Sum0 Sum1 Sum2 Sum3 Sum4 Sum5 Sum6 Sum7 
ana A B Cin Sum Cout
set A %x01
set B %x01
set Cin 0
s
set A %x05
set B %x03
set Cin 0
s
set A %x04
set B %x04
set Cin 1
s
set A %x05
set B %x03
set Cin 0
s
set A %x03
set B %xff
set Cin 0
s
set A %x32
set B %x12
set Cin 0
s
set A %x23
set B %x41
set Cin 0
s
set A %x21
set B %x31
set Cin 0
s