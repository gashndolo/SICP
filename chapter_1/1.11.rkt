#lang racket
;Getting the recursive process is quite direct
(define (funct n)
  (if (< n 3)
      n
      (+ (funct (- n 1))
         (* 2
            (funct (- n 2)))
         (* 3
            (funct (- n 3))))))
(funct 7) ;142
(funct 2) ;2

;Designing an iterative process becomes easier if you visualize the function
;       a      b        c
;f(3)-  f(2)   2.f(1)   3.f(0)   sum
;              1        0
;       2      2        0        4

;f(4)-  f(3)   2.f(2)   3.f(1)   sum
;              2        1
;       4      4        3        11

;f(5)-  f(4)   2.f(3)   3.f(2)   sum
;              4        2
;       11     8        6        25

;With each iteration, the states change as follows
;sum - a
;a   - b
;b   - c

;starting the iteration at f(3):

(define (f-iter n)
  (define (funct-iter a b c sum count)
    (cond ((< n 3) n)
          (else (if (= count n)
                    sum
                    (funct-iter sum a b (+ sum (* 2 a) (* 3 b)) (+ count 1))))))
  (funct-iter 2 1 0 4 3))
(f-iter 5) ;25
(f-iter 4) ;11

