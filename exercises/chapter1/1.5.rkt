 #lang sicp
(#%require rackunit)

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 1 2)
;(test 0 (p)) <-- endless recursion

; applicative order: (p) evaluates first, causing endless recursion error
; normal order: (p) evaluation is postponed, and then never done because of the (if)