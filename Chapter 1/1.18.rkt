#lang racket
(define (even? n) (= (remainder n 2) 0))
(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (mult a b)
  (define (mult-iter a b sum)
    (cond ((< b 2) sum)
          ((even? b) (mult-iter a (halve b) (+ sum (double a))))
          (else (mult-iter a (- b 1) (+ sum a)))))
  (mult-iter a b 0))

(mult 3 2)
(mult 3 3)
(mult 4 5)