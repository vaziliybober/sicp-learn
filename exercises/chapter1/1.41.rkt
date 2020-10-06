#lang sicp
(#%require rackunit)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(check-equal? (((double (double double)) inc) 5) 21)
