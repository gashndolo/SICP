#lang racket
; Using our (sqrt x) procedure on a small value like 0.0009 we get 0.040300622
; The correct answer is 0.03
; Our tolerance of 0.01 is too large meaning our algorithm will terminate prematurely

; Using our (sqrt x) procedure on a large value like 10000000000000 does not terminate
; It doesn't terminate because the (good-enough?) procedure returns false for large numbers

; A better (good-enough?) procedure could track the difference between the previous guess and the current guess
; And stop the computation when this difference is smaller than a small fraction of the guess

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess 0.001)))