#lang racket
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result) ))))
  (iter k (/ (n k) (d k))))
(+ 2 (cont-frac (lambda (i) 1.0)
                     (lambda (i) (cond ((= 0 (remainder i 3)) 1.0)
                                       ((= 2 (remainder i 3)) (* (/ (+ i 1) 3) 2.0))
                                       ((= 1 (remainder i 3)) 1.0)
                                       ))
                     100))