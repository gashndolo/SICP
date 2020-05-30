#lang racket
(define (sub-inter x y) ; x minus y
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))