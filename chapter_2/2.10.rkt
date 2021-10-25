#lang racket
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))

(define (span-zero? interval)
  (or (and (>= (upper-bound interval) 0) (<= (lower-bound interval) 0))
      (and (<= (upper-bound interval) 0) (>= (lower-bound interval) 0))))

(define (div-interval x y)
  (if (span-zero? y)
      (error "The interval(s) specified spans zero" y)
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define x (make-interval (- 1) 2))

(span-zero? x) ;#t
  