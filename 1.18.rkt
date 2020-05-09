#lang racket

(define (double a) (+ a a))

(define (fast*-iter a b)
  (define (*-iter a b sum)
    (if (= b 0)
        sum
        (cond ((even? b) (*-iter (double a) (/ b 2) sum))
              (else (*-iter a (- b 1) (+ sum a))))))
  (*-iter a b 0))
