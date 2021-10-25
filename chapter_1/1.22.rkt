#lang racket
;runtime is not a primitive in racket
;This is a solution I found online to implement (runtime)
(define (runtime) (current-milliseconds))

;Primality check from earlier in the book
(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;TImed Prime Test
;Modified to only print prime numbers but not odd numbers
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n) (begin (newline) (display n) (report-prime (- (runtime) start-time))) (display " ")))
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

;However, to see the difference in run-time when we increase the input by a factor of 10, Let us use larger numbers
(search-for-primes 10000000000 10000000100)
(newline)
(search-for-primes 100000000000 100000000100)
(newline)
(search-for-primes 1000000000000 1000000000100)

10000000019 *** 7      
10000000033 *** 8             
10000000061 *** 8   
10000000069 *** 9             
10000000097 *** 8  
 
100000000003 *** 24       
100000000019 *** 24                  
100000000057 *** 26  
100000000063 *** 25  
100000000069 *** 24 
100000000073 *** 27        
100000000091 *** 24     
                   
1000000000039 *** 75          
1000000000061 *** 79 
1000000000063 *** 76             
1000000000091 *** 87

;Notice that the runtime increases by 3 each time we add a zero
;This confirms the intimation in the question
;Note that sqrt(10) roughly equals 3