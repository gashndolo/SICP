#lang racket
;P runs five times
;(p (sin 4.05)
;(p (p (sin 1.35)))
;(p (p (p (sin 0.45))))
;(p (p (p (p (sin 0.15)))))
;(p (p (p (p (p (sin 0.05))))))

;The growth of the function would be logarithmic
;This is because each time we apply (p) to the argument it is divided by three
;O(log(a))