#lang racket
(define (fringe x)
  (cond ((null? x) null)
        ((pair? x)
         (append (fringe (car x)) (fringe (cdr x))))
        (else (list x))))
(define x (list (list 1 2) (list 3 4)))

(fringe x)
;'(1 2 3 4)
(fringe (list x x))
;(1 2 3 4 1 2 3 4)

(fringe (list 1 (list 2 3) (list 4 (list 5 (list 6 7)))))
;(1 2 3 4 5 6 7)