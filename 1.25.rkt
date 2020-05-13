#lang racket
;The new expmod takes way longer than the previous implementation
;The problem not being the number of steps but rather the size of the square computations

(#%require (lib "27.ss" "srfi"))
;runtime is not a primitive in racket
;This is a solution I found online to implement (runtime)
(define (runtime) (current-milliseconds))


;Primality check using Fermat's theormen
(define (square x) (* x x))
(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;TImed Prime Test
;Modified to only print prime numbers but not odd numbers
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 20) (begin (newline) (display n) (report-prime (- (runtime) start-time))) (display " ")))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;different timing method
;(define (start-prime-test n start-time)
;  (if (prime? n) (begin (display n) (report-prime (time (prime? n)))) (display " ")))

;Search for primes within a range
(define (search-for-primes from to)
  (cond ((= from to) (display " "))
        ((< from to)
         (if (even? from) (search-for-primes (+ from 1) to) (begin (timed-prime-test from) (search-for-primes (+ from 1) to))))))

;To get the first three prime numbers according to the question
;(search-for-primes (1000 1200)

(search-for-primes 1000000000 1000000100)
(newline)
;(search-for-primes 10000000000 10000000100)
(newline)
;(search-for-primes 1000000000000 1000000000100)

