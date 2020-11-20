#lang racket
(define (square x) (* x x))

(define (cube-rt x)
  (cube-rt-iter 1.0 x))
(define (cube-rt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-rt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess 0.001)))
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))
(cube-rt 9)