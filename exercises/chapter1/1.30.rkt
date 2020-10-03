#lang sicp
(#%require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
(iter a 0))

(define (inc x) (+ x 1))
(define (itself x) x)

(check-equal? (sum itself 1 inc 10 ) 55)

