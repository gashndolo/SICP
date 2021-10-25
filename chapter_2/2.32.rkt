#lang racket
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (set) (cons (car s) set)) rest)))))

(subsets (list 1 2 3)) 

;For a proper explanation check
;http://community.schemewiki.org/?sicp-ex-2.32