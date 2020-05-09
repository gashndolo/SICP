#lang racket
;Assume (halve b) = (/ b 2). Or better yet write the (halve x) procedure!
(define (double a) (+ a a))
(define (even? n)
  (= (remainder n 2) 0))
(define (fast* a b)
  (if (= 0 b)
      0
      (cond ((even? b) (fast* (double a) (/ b 2)))
            (else (+ a (fast* a (- b 1)))))))
(fast* 4 2) ;8
