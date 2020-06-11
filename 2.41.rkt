#lang racket
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low
            (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (check? x)
  (and (< (car x) (cadr x))
       (< (cadr x) (car (cdr (cdr x))))))
;-----------------------------------------------------------------------------------------------------------------------------------
;Haters will say my solution is not elegant and they would be right. Skillful Schemers would also say that
;I had issues with flatmap so I just used accumulate
(define (make-triple n s)
  (filter (lambda (x) (= (+ (car x) (cadr x) (car (cdr (cdr x)))) s))
   (filter check?
          (accumulate
           append null (flatmap (lambda (k)
                                  (map (lambda (i)
                                         (map (lambda (j) (list i j k))(enumerate-interval 1 n)))
                                       (enumerate-interval 1 n)))
                                (enumerate-interval 1 n))))))
(make-triple 10 15) ;Triples less than 10 that are in order and add up to 15
;((4 5 6) (2 6 7) (3 5 7) (1 6 8) (2 5 8) (3 4 8) (1 5 9) (2 4 9) (1 4 10) (2 3 10))