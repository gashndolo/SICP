#lang racket
#|
If for example we calculate the square root of 0.000002
With our method we get 0.0312713096020622 which is incorrect

The correct answer is 0.0014142135623731.
We simply aren't improving on the guess well enough

But our solution works if we change the good-enough check from 0.01 to something with more zeroes like 0.000001

To improve it we can compare the current guess to an improved guess and check the difference
(define (good-enough? guess x)
    (< (abs (- guess
               (improve-guess guess x)))
       (* (abs guess) 0.01)))
|# 