#lang racket
;Helper reverse procedure from 2.18
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

;New deep reverse procedure
(define (deep-reverse items)
  (define (deep item)
    (cond ((null? item) null)
          ((pair? (car item))
           (let ((h (car item)))
             (append (list (reverse h)) (deep (cdr item)))))
          (else (append (list (car item)) (deep (cdr item))))))
  (deep (reverse items)))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x) ;((4 3) (2 1))
(define y (list 1 2 3 4))
(deep-reverse y) ;(4 3 2 1) 
