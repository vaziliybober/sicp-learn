 #lang sicp
(#%require rackunit)

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              nil
              sequence))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-t)
                         (if (pair? sub-t)
                             (count-leaves sub-t)
                             1))
                       t)))


(check-equal? (count-leaves (list 1 2 (list 3 (list 4 5)))) 5)
