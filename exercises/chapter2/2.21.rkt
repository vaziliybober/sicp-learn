 #lang sicp
(#%require rackunit) 

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list2 items)
  (map (lambda (item) (* item item))
       items))

(check-equal? (square-list (list 1 2 3 4 5)) (list 1 4 9 16 25))
(check-equal? (square-list2 (list 1 2 3 4 5)) (list 1 4 9 16 25))
(car (list 1 2 3))