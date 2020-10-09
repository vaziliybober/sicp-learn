
#lang sicp
(#%require rackunit) 


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items))
              (list (car items)))))

(check-equal? (reverse (list 1 2 3 4)) (list 4 3 2 1))