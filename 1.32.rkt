#lang racket
(define (accumulate combiner null term a next b)
    (if (> a b)
        null
        (combiner (term a)
                  (accumulate combiner null term (next a) next b))))

(define (identity x) x)
(define (cube x) (* x x x))
(define (inc n) (+ n 1))

(accumulate + 0 cube 3 inc 5) ;216
(accumulate * 1 identity 3 inc 5) ;60
(accumulate + 0 identity 3 inc 5) ;12

;b
;accumulate as an iterative procedure
(define (accumulate combiner null term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null))