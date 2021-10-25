#lang racket
; helper funcs
(define (even? x)
  (= (remainder x 2) 0))
(define (double x) (* x 2))
(define (halve x) (/ x 2))

; solution
(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))
(fast-mult 2 4) ;8
