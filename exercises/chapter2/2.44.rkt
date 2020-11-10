 #lang sicp
(#%require rackunit)

(define below nil)
(define beside nil)

(define (up-split painter n)
  (let ((smaller (up-split painter (- n 1))))
    (below painter (beside smaller smaller))))
