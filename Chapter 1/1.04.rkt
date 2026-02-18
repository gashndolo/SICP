#lang racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#|
The operator will either be a "+" or "-" depending on whether or not b is greater than 0.
Basically the procedure will do a plus the absolute value of b
a + |b|
|#