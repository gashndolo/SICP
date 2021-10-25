#lang racket
(define (square x) (* x x))
(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-map tree)
  (map (lambda (tree)
         (if (pair? tree)
             (square-map tree)
             (square tree)))
       tree))
