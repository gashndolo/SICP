#lang racket
(define (product f a next b)
    (if (> a b)
        1
        (* (f a)
           (product f (next a) next b))))
(define (identity x) x)
(define (inc x) (+ x 1))
;Factorial
(define (fact n)
    (product identity 1 inc n))
(fact 5) ;120
;Pi approximation
;If you are stuck here be sure to check out the Wallis formula online and what it means
(define (next-wallis x)
  (if (even? x)
      (/ (+ x 2) (+ x 1))
      (/ (+ x 1) (+ x 2))))
(* (product next-wallis 1.0 inc 1000.0) 4)
;3.143160705532257

;Iterative product
(define (product f a next b) 
   (define (iter a result) 
     (if (> a b) result 
          (iter (next a) (* (f a) result)))) 
    (iter a 1)) 