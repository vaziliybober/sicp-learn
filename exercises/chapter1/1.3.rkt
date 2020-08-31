#lang sicp
(#%require rackunit)

(define (max a b)
  (if (> a b) a b))

(define (min a b)
  (if (< a b) a b))

(define (max-of-three a b c)
  (max (max a b) c))

(define (min-of-three a b c)
  (min (min a b) c))

(define (mid-of-three a b c)
  (- (+ a b c)
     (max-of-three a b c)
     (min-of-three a b c)))

(define (square x)
  (* x x))

(define (sum-of-squares a b)
  (+ (square a)
     (square b)))


(define (solution a b c)
  (sum-of-squares (max-of-three a b c)
                  (mid-of-three a b c)))

(check-equal? (max 1 2) 2)
(check-equal? (max-of-three 1 3 2) 3)
(check-equal? (square 2) 4)
(check-equal? (sum-of-squares 1 3) 10)
(check-equal? (mid-of-three 1 3 5) 3)
(check-equal? (solution 1 3 5) 34)