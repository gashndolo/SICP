#lang racket
;you should note that this rectangle implementation uses points on a plane and would only work
;with all points in the first quadrant (at least that's the only quadrant which I've bothered to test


;The alternate rectangle representation works for lopsided rectangles (if the answer is negative jsut absolute it
;I have not tested whether this first representation works for lopsided rectangles (it probably should though as we are working with points on a plane)


;Helper procedures
(define (make-segment x y) (cons x y))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))

;Wrap area and perimeter in their own abstraction layer
(define (perimeter rectangle)
  (+ (* 2 (length rectangle))
     (* 2 (width rectangle))))

(define (area rectangle)
  (* (width rectangle)
     (length rectangle)))

; 1      Rectangle implementation as three points (the base point to the end of the length point and to the end of the width point
(define (make-rectangle x y) (cons x y))
(define (width rectangle)
  (- (x-point (end-segment (cdr rectangle))) (x-point (start-segment (cdr rectangle)))))
(define (length rectangle)
  (- (y-point (end-segment (car rectangle))) (y-point (start-segment (car rectangle)))))

;Testing this implementation
(define base-point (make-point 0 0))
(define long-point (make-point 10 0))
(define high-point (make-point 0 5))

(define length-seg (make-segment base-point long-point))
(define height-seg (make-segment base-point high-point))

(define my-rectangle (make-rectangle height-seg length-seg))
(area my-rectangle) ;50
(perimeter my-rectangle) ;30

; 2      Different rectangle implementation as a single hypotenuse segment (assume the hypotenuse rises from left to right)
;(define (alt-rectangle base height) (make-segment base height))

(define (width rectangle)
  (- (x-point (end-segment rectangle))
     (x-point (start-segment rectangle))))
(define (length rectangle)
  (- (y-point (end-segment rectangle))
     (y-point (start-segment rectangle))))
(define base (make-point 0 0))
(define h (make-point 10 5))

 ;Testing this alternate implementation
(define my-alt-rectangle (make-segment base h))
(area my-alt-rectangle) ;50
(perimeter my-alt-rectangle) ;30
