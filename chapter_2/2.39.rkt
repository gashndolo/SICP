#lang racket

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

