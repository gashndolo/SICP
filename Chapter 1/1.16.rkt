#lang racket
(define (even? n) (= (remainder n 2) 0))
(define (square x) (* x x))

(define (exp b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(exp 2 0) ;1
(exp 2 1) ;2
(exp 2 2) ;4
(exp 2 3) ;8
(exp 2 4) ;16
(exp 2 5) ;32