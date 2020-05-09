#lang racket
;Excuse my formating. p2 means p squared.

;Now to the problem

;The wording was a bit difficult for me, but once you get it becomes a problem of simple expansion
;Tpq:(a,b) gives you (bq+aq+ap,bp+aq)

;Then we evaluate
;Tp'q'(bq+aq+ap,bp+aq)

;bq+aq+ap is the new a
;bp+aq is the new b

;Apply the transformation given in the question (a <- bq + aq + ap, b <- bp + aq)
;To get
;(bp +aq)q + (bq + aq ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q


;Expand
;bpq + aq2 + bq2 + aq2 + apq + bqp + aqp + ap2,  bp2 + aqp + bq2 + aq2 + apq


;Now while reducing be careful to spot the patterns

;bq + aq + ap and bp + aq

;b(2pq + q2) + a(2pq + q2) + a(q2 + p2), b(p2 + q2) + q(2pq + q2)

;And now we can see that
;p = p2 + q2
;q = 2pq + q2

;completing the procedure
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))  ; compute p′
                   (+ (* 2 p q) (* q q)) ; compute q′
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
(fib 17) ;1597

;We can confirm the answer with the less effecient, recursive O(n) fib function
(define (fib-recurs n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recurs (- n 1))
                 (fib-recurs (- n 2))))))
(fib-recurs 17) ;1597