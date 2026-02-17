#lang racket
(define (pascals i j)
  (if (or (= j 1) (= i j))
      1
      (+ (pascals (- i 1) (- j 1))
         (pascals (- i 1) j))))

(pascals 5 2)
(pascals 5 3)

#|
Note, I started my triangle at (1,1) if you start yours at (0,0) you can just change the checks in the if statement
           1(1,1)
     1(2,1)   1(2,2)
   1(3,1)  2(3,2)   1(3,3)
 1(4,1)  3(4,2)   3(4,3)  1(4,4)

|#