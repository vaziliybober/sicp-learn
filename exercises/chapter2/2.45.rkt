 #lang sicp
(#%require rackunit)

(define below nil)
(define beside nil)

(define (split half-sep quart-sep)
  (define (f painter n)
    (let ((smaller (f painter (- n 1))))
      (half-sep painter (quart-sep smaller smaller))))
  f)

(define right-split (split beside below))
(define up-split (split below beside))

