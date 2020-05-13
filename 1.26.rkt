#lang racket

;Clearly, writing the procedure like this computes (expmod base (/ exp 2) m) twice:
;This is a charecteristic of tree recursive processes
;Notice that using square instead of (*) halves the amount of steps taken