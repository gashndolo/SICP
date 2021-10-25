#lang racket
(define (make-center-percent c p)
  (make-interval (- c (abs (* c (/ p 100))))
                 (+ c (abs (* c (/ p 100))))))

(define (percent interval)
  (* 100 (/ (width interval) (center interval)))) 
                 