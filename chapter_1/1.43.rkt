#lang racket
(define (repeated f n)
  (define (apply f n result)
    (if (< n 1)
        result
        (apply f (- n 1) (f result))))
  (lambda (x) (apply f (- n 1) (f x))))
(define (square x) (* x x))
((repeated square 2) 5)

;Using the compose function from 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated-compose f n)
  (if (= n 1)
      f 
      (compose f (repeated-compose f (- n 1)))))

((repeated-compose square 2) 5)
                      

        