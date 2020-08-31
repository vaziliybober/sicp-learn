#lang sicp
(#%require rackunit)

; returns a + abs(b)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 1 2) 3)
(check-equal? (a-plus-abs-b 1 -2) 3)