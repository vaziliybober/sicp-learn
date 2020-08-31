#lang sicp
(#%require rackunit)

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess)
             x))
     0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;because of applicative order both then-clause and else-clause will always be
;evaluated, so an endless recursion will occur

;(sqrt-iter 1 2) <-- endless recursion