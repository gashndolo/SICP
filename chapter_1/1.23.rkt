#lang racket
;runtime is not a primitive in racket
;This is a solution I found online
(define (runtime) (current-milliseconds))

;next procedure
(define (next n)
    (if (= n 2) 3 (+ n 2)))

;Primality check 
(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

;TImed Prime Test
;Modified to only print prime numbers but not odd numbers
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n) (begin (newline) (display n) (report-prime (- (runtime) start-time))) (display " ")))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;Search for primes within a range
(define (search-for-primes from to)
  (cond ((= from to) (display " "))
        ((< from to)
         (if (even? from) (search-for-primes (+ from 1) to) (begin (timed-prime-test from) (search-for-primes (+ from 1) to))))))

;I'm using larger numbers than those in the question to highlight the difference better feel free to change the procedures for example to (search-for-primes 10000 12000)
(search-for-primes 10000000000 10000000100)
(newline)
(search-for-primes 100000000000 100000000100)
(newline)
(search-for-primes 1000000000000 1000000000100)

;Using the new (next test-divisor) as opposed to the previous (* test-divisor 1) in ex 1.22, we see a ratio of about 1.5
;See my implementation of the previous exercise (1.22)


10000000019 *** 4      
10000000033 *** 5             
10000000061 *** 5   
10000000069 *** 5             
10000000097 *** 4  
 
100000000003 *** 15       
100000000019 *** 14                  
100000000057 *** 14  
100000000063 *** 14  
100000000069 *** 14 
100000000073 *** 14        
100000000091 *** 15     
                   
1000000000039 *** 51          
1000000000061 *** 54
1000000000063 *** 58             
1000000000091 *** 55