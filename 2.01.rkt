#lang racket
(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (cond ((or (< n 0) (< d 0)) (cons (- (/ (abs n) g)) (/ (abs d) g)))
          (else (cons (/ n g) (/ d g))))))