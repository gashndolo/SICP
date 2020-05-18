#lang racket
(define (cubic a b c)
    (lambda (x) (+ (cube x)
                   (* a (square x))
                   (* b x)
                   c)))
;You must specify a b c to run the function
(define a 1)
(define b 1)
(define c 1)