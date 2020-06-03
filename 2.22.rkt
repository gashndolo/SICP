#lang racket
;Louis Reasoner's iterative square list passes the first item of the cdr of the list as the first item in the new list
;Doing this over and over results in a reversed list

;By interchanging the arguments of the cons Louis has now placed the null at the beginning of the list messing up the entire pair structure of the list
;Now Louis has a list made of several list instead of just a list of items