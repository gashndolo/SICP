#lang racket
;The procedure a-plus-abs-b takes two arguments a and b and either add a to b or substracts b from a
;if b is greater than 0 the procedure adds a and b
;if b is less than 0 it substracts b from a
;This also means the procedure basically adds a and the absolute value of b (as given in the name of the procedure
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
(a-plus-abs-b 1 2)
;3
(a-plus-abs-b 1 (- 2))
;3