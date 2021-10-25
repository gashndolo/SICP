#lang racket
(define (for-each-test proc items)
  (if (null? items)
      #t
      (begin (proc (car items))
             (for-each-test proc (cdr items)))))

(for-each-test (lambda (x)
                 (newline)
                 (display x))
               (list 57 321 88))