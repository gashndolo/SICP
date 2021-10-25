#lang racket
;Running (count-change 11) in the interpreter returns 4, so we can cross check our tree diagram
;To simplify things
;We can not use coins > 10 to make change for 11... We also can not make change for negative money
;                           11(50 25 10 5 1)
;                                 |
;                           11(25 10 5 1)
;                                 |
;                           11(10 5 1)
;                                 |
;                -------------------------------------
;             11(5 1)                            1(10 5 1)
;                |                                   |
;    ----------------------                    ---------------       
;*11(1)                6(5 1)               1(5 1)          (negative)
;                        |                     |
;                    ------------            *1(1)  
;                 *6(1)       1(5 1)         
;                               |
;                             *1(1)

;My analysis skils are not the best to be honest. Consider this solution
;(http://community.schemewiki.org/?sicp-ex-1.14)
;Ps consider the number of branches in the tree and the number of nodes in the tree
;The growth should be exponential