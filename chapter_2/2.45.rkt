#lang racket
(define (split main split) 
   (lambda (painter n) 
     (cond ((= n 0) painter) 
           (else 
            (let ((smaller ((split main split) painter (- n 1)))) 
              (main painter (main smaller smaller))))))) 