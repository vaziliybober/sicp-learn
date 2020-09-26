#lang sicp
(#%require rackunit)

;(define (+ a b)
;  (if (= a 0)
;      b
;      (inc (+ (dec a) b)))) <-- recursive

;(define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b)))) <-- iterative