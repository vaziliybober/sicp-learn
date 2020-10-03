#lang sicp
(#%require rackunit)

(define (C n m)
  (if (or (= m 0) (= m n))
      1
      (+ (C (- n 1) (- m 1))
         (C (- n 1) m))))

(C 4 4)
