#lang racket
;My solution involves removing the last element of a list and appending it to the new list with the items reversed
;Check these solutions out
;http://community.schemewiki.org/?sicp-ex-2.18

(define (remove-last items)
  (if (null? (cdr items))
      null
      (cons (car items)
            (remove-last (cdr items)))))

(define (reverse items)
  (define (reverse-iter items newitems)
    (if (null? items)
        newitems
        (reverse-iter (remove-last items) (append newitems (last-pair items)))))
  (reverse-iter items '()))

(define squares (list 1 4 9 16 25))

(reverse squares)
;'(25 16 9 4 1)