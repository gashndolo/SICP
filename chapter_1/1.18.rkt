#lang racket
; helper funcs
(define (even? x)
  (= (remainder x 2) 0))
(define (double x) (* x 2))
(define (halve x) (/ x 2))

;solution
(define (mult b c)
  (define (mult-iter a b c)
    (cond ((= c 0) a)
          ((even? c) (mult-iter a (double b) (halve c)))
          (else (mult-iter (+ a b) b (- c 1)))))
  (mult-iter 0 b c))

(mult 2 4) ;8