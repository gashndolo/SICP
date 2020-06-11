#lang racket
;------------------------Helper functions------------------------ 
(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))
;------------------------solutions------------------------------------------------
(define vector1 (list 1 2 3))
(define vector2 (list 4 5 6))
(define vector3 (list 7 8 9))
(define matrix1 (list vector1 vector2 vector3))
(define matrix2 (list vector1 vector3 vector2))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (seq) (dot-product seq v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (seq) (matrix-*-vector cols seq)) m)))

(dot-product vector1 vector2)
(matrix-*-vector matrix1 vector1)
(transpose matrix1)
(matrix-*-matrix matrix1 matrix2)