#lang sicp
(#%require rackunit)

(define (prod2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
(iter a 1))

(define (prod term a next b)
  (if (> a b)
      1
      (* (term a)
         (prod term (next a) next b))))

(define (fact n) (prod itself 1 inc n))

(define (inc x) (+ x 1))
(define (itself x) x)

(check-equal? (fact 3) 6)
(check-equal? (fact 4) 24)

(define (term x) (/ (* (- x 1) (+ x 1))
                    (* x x)))

(define (next x) (+ x 2))

(define (quarter-pi n) (prod term 3 next (- n 2)))

(quarter-pi 10)
(/ 314 100 4)


