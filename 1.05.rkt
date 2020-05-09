#lang racket
;According to the book,
;With applicative-order, the interpreter evaluates the elements of the combination and applies the procedure to the arguments.
;Since (p) just calls itself the program never terminates and is stuck at evaluating (p)
(test 0 (P))

;With normal-order evaluation, the interpreter expands to:
(if (= 0 0) 0 (p))
;And returns 0 (It never has to evaluate (p))