#lang racket

;Here's my iterative solution
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result) ))))
  (iter k (/ (n k) (d k))))
;You can get the approximation correct to 4dp by using k=12 (Get a more accurate phi by using k > 50
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

;Converting my solution to be recursive
(define (cont-frac n d k)
 (if (= k 0)
     0
     (/ (n k)
        (+ (d k) (cont-frac n d (- k 1))))))
