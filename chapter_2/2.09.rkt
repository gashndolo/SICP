#lang racket
(define (average x y) (/ (+ x y) 2))

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))

(define (width a) (/ (- (upper-bound a) (lower-bound a)) 2))

(define x (make-interval 3.5 4.5))
(define y (make-interval 1 3))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(width x)
(width y)
(average (width x) (width y))
(width (add-interval x y))
(width (mul-interval x y))

;When adding intervals the width of the sum seems to be twice the average width of the intervals