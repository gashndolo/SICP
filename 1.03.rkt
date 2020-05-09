#lang racket
;min and max funcitons have not been introduced at this point
(define (square x) (* x x))
(define (sum-square x y) (+ (square x) (square y)))
(define (sum-square-two-largest x y z)
  (cond ((and (>= x z) (>= y z)) (sum-square x y))
        ((and (>= x y) (>= z y)) (sum-square x z))
        ((and (>= y x) (>= z x)) (sum-square y z))))
(sum-square-two-largest 4 2 3)
;25
