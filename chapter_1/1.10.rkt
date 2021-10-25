#lang racket
(A 1 10);Take you time to expand this first one to see the expansion and reduction
1024
(A 2 4) ;Just plug into the interpreter
65536
(A 3 3) ;You may also expand but only until you get to the point where it reduces to (A 2 4) Expanding fully could take a long time
65536

f(n) = 2n
g(n) = 2^n
h(n) = 2^(h(n-1))