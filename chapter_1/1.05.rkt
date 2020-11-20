#lang racket
; With applicative order evaluation we evaluate the body of the procedure
; with each formal parameter replaced by the corresponding argument
; (if (= x 0) 0 y)
; (if (= 0 0) 0 (p))
; According to the if condition in the question, we would never have to evaluate (p)
; This model would return 0


; With normal order evaluation, the interpreter would be stuck forever trying to implement (p)
; Over and over