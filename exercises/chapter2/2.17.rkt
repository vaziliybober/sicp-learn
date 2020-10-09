 
 #lang sicp
(#%require rackunit) 

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(check-equal? (last-pair (list 1 2 3 4)) 4)