#lang racket
;Helper procedures
(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (square x) (* x x))

(define tolerance 0.00001)
(define (fixed-point f guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try guess))

;(define (sqrt x)
;   (fixed-point (average-damp (lambda (y) (/ x y)))
;               1.0))
;(sqrt 4)
; 1 average-damp

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
;Let's create a simple procedure to conduct the experiment 
(define (n-th-rt x n)
  (fixed-point (average-damp (average-damp (average-damp (average-damp (lambda (y) (/ x (fast-expt y (- n 1))))))))
               1.0))
(n-th-rt 65536 16)
;4th root : 2 average-damp(s)
;5th root : 2 average-damp(s)
;6th root : 2 average-damp(s)
;7th root : 2 average-damp(s)
;8th root : 3 average-damp(s)
;16th root: 4 average-damp(s)

;Seems like the number of average-damps needed for the nth root  increases at 2^(n) by 1
;So the 32nd root would be 5 average-damps
;We can find the number of average-damps needed by finding log(base 2) n (for the nth root)
(floor (log 5 2)) ;2

;Remember the repeat procedure from ex 1.43 i called mine "repeated-compose"
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated-compose f n)
  (if (= n 1)
      f 
      (compose f (repeated-compose f (- n 1)))))
;We can now formulate the nth root procedure with the necessary number of average-damps
(define (nth-root x n)
  (fixed-point ((repeated-compose average-damp (floor (log n 2))) (lambda (y) (/ x (fast-expt y (- n 1)))))
               1.0))
;Finding the 16th root of 65536
(nth-root 65536 16)
