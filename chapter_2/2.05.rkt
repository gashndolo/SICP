#lang racket
(define (pair a b)
  (* (expt 2 a)
     (expt 3 b)))

;A simple algorithm to get the car of a pair is to divide the pair by 2; and each time it is divisble by 2, add 1 to a counter
(define (car z)
  (define (iter z counter)
    (if (= (remainder z 2) 0)
        (iter (/ z 2) (+ 1 counter))
        counter))
  (iter z 0))
;Flip it to find the cdr
(define (cdr z)
  (define (iter z counter)
    (if (= (remainder z 3) 0)
        (iter (/ z 3) (+ 1 counter))
        counter))
  (iter z 0))
;Test
; lets have a pair (1,2) i.e 18
(car 18) ;1
(cdr 18) ;2


;lets have a pair  (2,3) i.e 108
(car 108) ;2
(cdr 108) ;3

