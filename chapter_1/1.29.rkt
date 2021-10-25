#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* k h))))
    (define (simp-term k)
      (cond ((= k 0) (y k))
          ((even? k) (* 2 (y k)))
          (else (* 4 (y k)))))
    (* (/ h 3)
       (sum simp-term 0 inc n)))
(define (cube x) (* x x x))
(define (inc n) (+ n 1))

(simpson cube 0.0 1.0 100)
(simpson cube 0.0 1.0 1000)

;0.25333333333333324
;0.2503333333333336

;Using the integral function in the book with a dx of 0.01 we get 0.24998750000000042
;Using a dx of 0.001 we get a slightly better approximation 0.249999875000001