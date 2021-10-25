#lang racket
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (except-first-denomination coins) (cdr coins))
(define (first-denomination coins) (car coins))
(define (no-more? coins) (null? coins))

(first-denomination us-coins)
(except-first-denomination us-coins)

;No it does not affect the answer produced by cc because why would it?