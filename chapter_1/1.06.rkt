#lang racket
; Using the new-if, the program runs out of memory and is unable to execute
; Remember that the if special form will evaluate the predicate then only evaluate either the then-clause or the else-clause (but not both) 
; The new-if procedure is not a special form.
; Therefore all parts of the procedure will be evaluated,
; This means that the clauses will all be evaluated and new-if will constantly call itself from the recursive call to sqrt-iter
; consider (sqrt 9)
; (new-if (good-enough? 1.0 9)
;         1.0
;         (sqrt-iter (improve 1.0 9) 9)) ;The predicate (good-enough? 1.0 9) 