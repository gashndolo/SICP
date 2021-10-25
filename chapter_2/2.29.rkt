#lang racket
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

;b
;Having problems figuring out this section, will come up with a proper solution

;c
(define (torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (= (torque (left-branch mobile)) (torque (right-branch mobile))))
;d
;Change from
(define (right-branch mobile) (car (cdr mobile)))
;to
(define (right-branch mobile) (cdr mobile))

(define x (make-branch 2 6))
(define z (make-branch 3 x))
(define y (make-branch 2 8))
(define test-mob (make-mobile z y))

