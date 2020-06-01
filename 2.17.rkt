#lang racket
(define one-through-four (list 1 2 3 4))
one-through-four

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))
(last-pair one-through-four)
4

             