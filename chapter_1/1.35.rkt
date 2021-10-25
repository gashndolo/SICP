#lang racket
;Solve x -> 1 + 1/x
;x^2 = x + 1
;x^2-x-1=0
;Using quadratic formula
; x = (1 + sqrt(5)) / 2

(fixed-point (lambda (x) (+ 1.0 (/ 1.0 x))) 1.0)
1.6180327868852458