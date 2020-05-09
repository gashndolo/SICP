#lang racket
;Applicative evaluation will run remainder 4 times
(gcd 206 40)
(if (= b 0)
    a
    (gcd 40 (remainder 206 40))) ; 1
(gcd 40 6)
(if (= b 0)
    a
    (gcd 6 (remainder 40 6)))    ; 2
(gcd 6 4)
(if (= b 0)
    a
    (gcd 4 (remainder 6 4)))     ; 3
(gcd 4 2)
(if (= b 0)
    a
    (gcd 2 (remainder 2 0)))     ; 4
(gcd 2 0)

;The gcd/remainder does not evaluate because the predicate is evaluated to true
(if (= b 0)
    a
    (gcd 0 (remainder 2 0)))

;Normal order evaluation will run remainder 18 times.
;Remember the rule "fully expand then reduce"
(gcd 206 40)

;40 6
(gcd 40 (rem 206 40))

;6 4
(gcd (rem 206 40)
     (rem 40 (rem 206 40)))

;4 2
(gcd (rem 40 (rem 206 40))
     (rem (rem 206 40)
          (rem 40 (rem 206 40))))

;2 0
(gcd (rem (rem 206 40)
          (rem 40 (rem 206 40)))
     (rem (rem 40 (rem 206 40))
          (rem (rem 206 40))
          (rem 40 (rem 206 40))))

;The predicate in the if condition will run remainder 7 times and the gcd procedure will run remainder 11 times