#lang racket
(define (cubrt x)
    (cubrt-iter 1.0 x))
(define (cubrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (= (improve guess x) guess))
(define (improve guess x)
   (/ (+ (/ x (square guess))
         (* 2 guess))
      3))
(define (square x) (* x x))
(cubrt 27)
;3.0
(cubrt 5)
;1.7099759466766971.709975946676697