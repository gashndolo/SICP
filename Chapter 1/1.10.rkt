#lang racket
#|
Doing the substitution manually would take way too long so simply run the code
> (A 1 10)
1024

> (A 2 4)
65536

> (A 3 3)
65536
|#

#|

(f n) computes 2n 

(g n) computes 2^n

(h n) computes a tetration (repeated exponentiation): (A 2 n) => (A 1 (A 2 (- n 1))) => (g (h (- n 1))).

(k n) computes 5n^2

|#