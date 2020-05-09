#lang racket
;For very small numbers
;The good-enough? test has a very large tolerance (just 0.001)
;When it comes to improving the guess, the good-enough? test will "Give up" very quickly instead of continuing to improve the guess (because of the large tolerance)
;e.g (sqrt 0.0000000005) gives 0.031250...5 instead of the more accurate 0.0000223606

;For very large numbers
;Trying to run (sqrt 10000000000000) can't even compute on my machine
;This could mean that the square of the guess may not be close to the radicand by less than 0.001

;improved good-enough? to keep track of the difference between current guess and previous guess
;Simply improving the guess to a point where there's no improvement between the current guess and the previous one
(define (good-enough? guess x) 
   (= (improve guess x) guess))