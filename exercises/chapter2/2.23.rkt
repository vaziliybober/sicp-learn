#lang sicp
(#%require rackunit)

(define (for-each proc items)
  (define (execute)
    (proc (car items))
    (for-each proc (cdr items)))
  (if (not (null? items))
      (execute)))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))