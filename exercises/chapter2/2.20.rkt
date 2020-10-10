 
 #lang sicp
(#%require rackunit)

(define (same-parity? x y)
  (= (remainder x 2) (remainder y 2)))

(define (same-parity first . others)
  (define (inner first others)
    (if (null? others)
      nil
      (if (same-parity? first (car others))
          (cons (car others) (inner first (cdr others)))
          (inner first (cdr others)))))
   (cons first (inner first others)))

(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-equal?(same-parity 2 3 4 5 6 7) (list 2 4 6))