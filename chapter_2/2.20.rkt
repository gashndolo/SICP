#lang racket
(define (parity-check a b)
  (or (and (even? a) (even? b))
      (and (odd? a) (odd? b))))

(define (same-parity . w)
  (define (iter oglist newlist)
    (if (null? oglist)
        newlist
        (if (parity-check (car oglist) (car newlist))
            (iter (cdr oglist) (append newlist (list (car oglist))))
            (iter (cdr oglist) newlist))))
  (iter (cdr w) (list (car w))))

(same-parity 1 2 3 4 5 6 8 10)
;'(1 3 5)
(same-parity 2 3 4 5 6 8 10)
;'(2 4 6 8 10)