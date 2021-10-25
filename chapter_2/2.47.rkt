#lang racket
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define frame1 (make-frame 0 1 2))

(define (origin frame) (car frame))
(define (edge1 frame) (cadr frame))
(define (edge2 frame) (caddr frame))

(origin frame1)
(edge1 frame1)
(edge2 frame1)

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define frame (make-frame 4 5 6))
(define (origin frame) (car frame))
(define (edge1 frame) (cadr frame))
(define (edge2 frame) (cdr (cdr frame)))

(origin2 frame2)
(edge1 frame2)
(edge2 frame2)