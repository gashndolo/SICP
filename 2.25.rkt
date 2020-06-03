#lang racket
;Did you get it backwards like me on the first try? Or forget about the null at the end of a list?

(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))

(car (car(list (list 7))))

;Remember "cadr" from the book? I didn't
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))))))))
