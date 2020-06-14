#lang racket
(define (make-vect x y) (cons x y))
(define (xcor-vect vect) (car vect))
(define (ycor-vect vect) (cdr vect))

(define (add-vect x y) (make-vect (+ (xcor-vect x) (xcor-vect y))
                                  (+ (ycor-vect x) (ycor-vect y))))
(define (sub-vect vect1 vect2) (make-vect (- (xcor-vect vect1) (xcor-vect vect2)) 
                                    (- (ycor-vect vect1) (ycor-vect vect2)))) 
(define (scale-vect s vect) (make-vect (* s (xcor-vect vect)) 
                                      (* s (ycor-vect vect)))) 