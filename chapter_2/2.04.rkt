#lang racket
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x

(define (cdr z)
  (z (lambda (p q) q)))