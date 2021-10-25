#lang racket
;--------------------------------------------------------------------------------
;Helper functions
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low
            (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime? x) 
   (define (test divisor) 
     (cond ((> (* divisor divisor) x) true) 
           ((= 0 (remainder x divisor)) false) 
           (else (test (+ divisor 1))))) 
   (test 2))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;--------------------------------------------------------------------------------
(define (check? x) ;Check that j is less than i
  (< (car x) (cadr x)))

(define (unique-pairs n)
  (filter check?
        (flatmap (lambda (i)
           (map (lambda (j) (list i j)) (enumerate-interval 1 n)))
         (enumerate-interval 1 n))))

(define (prime-sum-pairs n)
  (filter prime-sum? (unique-pairs n)))

(prime-sum-pairs 6)