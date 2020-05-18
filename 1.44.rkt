#lang racket
(define (smooth f)
  (lambda (x) 
    (/ (+ (f (- x dx)) 
           (f x) 
           (f (+ x dx))) 
        3)))
(define (n-fold f n)
  ((repeated smooth n) f))