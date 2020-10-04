#lang sicp
(#%require rackunit)


(define (inc x) (+ x 1))
(define (itself x) x)


(define (accumulate null-value combiner term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate null-value combiner term (next a) next b))))

(define (accumulate2 null-value combiner term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a) result))))
  (iter a null-value))

(define (prod-combiner x acc)
  (* acc x))

(define (sum-combiner x acc)
  (+ acc x))

(define (prod term a next b)
  (accumulate 1 prod-combiner term a next b))

(define (sum term a next b)
  (accumulate2 0 sum-combiner term a next b))


(check-equal? (prod itself 1 inc 5 ) 120)
(check-equal? (sum itself 1 inc 10 ) 55)


 
