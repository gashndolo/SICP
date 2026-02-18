#lang racket
#|
What happens is that we are stuck in an infinite loop

We are using applicative order evaluation;
and this line of code will cause the infinite loop as the sqrt-iter will always be evaluated
(new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
|#