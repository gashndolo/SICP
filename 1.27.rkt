#lang racket
;Supporting functions
(define (square x) (* x x))

(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;Solution
(define (carmichael-test n)
    (define (iter a n)
      (if (= a n)
          #t
          (if (= (modulo a n)
                 (modulo (fast-expt a n) n))
              (iter (+ a 1) n)
              #f)))
    (iter 2 n))

(define (test n) (begin (display (carmichael-test n)) (prime? n)))

(test 561)
;#t#f

