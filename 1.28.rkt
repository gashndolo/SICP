#lang racket
(define (square x) (* x x))
(define (non-trivial x n)
    (and (not (= x 1)) (not (= x (- n 1)))
         (= (remainder (square x) n) 1)))
(define (check-square x m)
    (if (non-trivial x m)
        0
        (remainder (square x) m)))

;New expmod
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (check-square (expmod base (/ exp 2) m) m))
          (else
           (remainder
            (* base (expmod base (- exp 1) m))
            m))))
(define (miller-rabin-test n)
    (define (try-it a)
      (= (expmod a (- n 1) n) 1))
    (try-it (+ 1 (random (- n 1)))))
(define (miller-rabin-prime n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (miller-rabin-prime n (- times 1)))
        (else #f)))

(miller-rabin-prime 1105 100) ;f
(miller-rabin-prime 561 100)  ;f

;561 and 1105 both fool the Fermat test but not the Miller-Rabin test