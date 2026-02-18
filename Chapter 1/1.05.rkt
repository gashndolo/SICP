#lang racket
#|
With applicative order we will end up with an infinite loop because we
are evaluating the sub expressions and then applying the operator
(p) will cause an infinite loop

But with normal order evaluation we will fully expand then evaluate
(if (= x 0) 0 (p))
We never get to the (p)
We have a hint in the exercise -
(Assume that the evaluation
rule for the special form if is the same whether the interpreter
is using normal or applicative order: e predicate
expression is evaluated first, and the result determines
whether to evaluate the consequent or the alternative expression.)
|#