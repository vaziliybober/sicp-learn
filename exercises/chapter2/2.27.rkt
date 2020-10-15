#lang sicp
(#%require rackunit)

(define (reverse items)
  (define (iter source result)
    (if (null? source)
        result
        (iter (cdr source) (cons (car source) result))))
  (iter items nil))

(define (deep-reverse items)
  (define (iter source result)
    (if (null? source)
        result
        (iter (cdr source) (cons (deep-reverse (car source)) result))))
  (if (not (pair? items))
      items
      (iter items nil)))

(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)


