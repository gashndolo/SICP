#lang racket
(define (iterative-improve close-check improve-guess)
  (lambda (guess) (if (close-check guess)
                      guess
                      ((iterative-improve close-check improve-guess) improve-guess guess))))

;Square root helper functions
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (iterative-improve close-check improve-guess)
    (lambda (guess) (if (close-check guess x)
                        guess
                        ((iterative-improve close-check improve-guess) (improve-guess guess x)))))
  ((iterative-improve good-enough? improve) 1))

(sqrt 4.0)
;2.0000000929222947

;Fixed point helper functions
(define tolerance 0.00001)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2))
     tolerance))


(define (fixed-point f)
  (define (iterative-improve close-check improve-guess)
    (lambda (guess) (if (close-check guess (improve-guess guess))
                        guess
                        ((iterative-improve close-check improve-guess) (improve-guess guess)))))
  ((iterative-improve close-enough? f) 1.0))

(fixed-point cos)
;0.7390893414033927