#lang racket
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f-iter n)
  (define (iter a b c counter)
    (if (= counter 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- counter 1))))
  (iter 0 1 2 n))

;Here's an explanation if your are struggling with the iterative solution
;https://stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11