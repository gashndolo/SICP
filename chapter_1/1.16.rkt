#lang racket
(define (square x) (* x x))
(define (even? x)
  (= (remainder x 2) 0))
(define (exp b n)
  (define (exp-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (exp-iter a (square b) (/ n 2)))
          (else (exp-iter (* a b) b (- n 1)))))
  (exp-iter 1 b n))
(exp 3 5) ;243