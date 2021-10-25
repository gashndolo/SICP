#lang racket
;Rememeber that this prime? funciton from the book counts 1 as a prime number
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
;solution
(define (inc c) (+ c 1))
(define (square x) (* x x))

(define (filter-accumulate filter combiner null term a next b)
    (if (> a b)
        null
        (if (filter a)
            (combiner (term a)
                      (filter-accumulate filter combiner null term (next a) next b))
            (combiner null (filter-accumulate filter combiner null term (next a) next b)))))
;a
(filter-accumulate prime? + 0 square 3 inc 7) ;83

;b
(define (identity a) a)

(define (prod-rel-prime n)
  (define (rel-prime a)
    (= (gcd a n) 1))
  (filter-accumulate rel-prime * 1 identity 1 inc n))

(prod-rel-prime 5) ;24