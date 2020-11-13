 #lang sicp
(#%require rackunit)

(define (equal? l1 l2)
  (cond ((and (pair? l1) (pair? l2)) (equal? (cdr l1) (cdr l2)))
        ((and (not (pair? l1)) (not (pair? l2))) (eq? l1 l2))
        (else #f)))

(check-equal? (equal? '(this is a list) '(this is a list)) #t)
(check-equal? (equal? '(this is a list) '(this (is a) list)) #f)
