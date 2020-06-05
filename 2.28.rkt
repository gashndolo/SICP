#lang racket
(define (fringe x)
  (cond ((null? x) null)
        ((pair? (car x))
         (append (fringe (car x)) (fringe (cdr x))))
        (else x)))
(define x (list (list 1 2) (list 3 4)))

(fringe x)
;'(1 2 3 4)
(fringe (list x x))
'(1 2 3 4 1 2 3 4)
         