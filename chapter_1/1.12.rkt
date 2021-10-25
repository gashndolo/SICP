#lang racket
;By this stage of the book we can not write a function to print out Pascal's triangle to a given nth level
;We can however find the 1st, 2nd, 3rd... element of the nth level
;I have not included a test to check if a hypothetical user tries to find an entry that does not exist. For example trying to find the 4th element of the third level (does not exist)

(define (pascal x y) ;finds the xth element of the yth level in the triangle
  (if (= x 1)
      1
      (if (= x y)
          1
          (+ (pascal (- x 1) (- y 1))
             (pascal x (- y 1))))))
(pascal 1 1) ;1
(pascal 3 4) ;3
(pascal 2 3) ;2
