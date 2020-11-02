 #lang sicp
(#%require rackunit)

(define (square x)
  (* x x))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree2 tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree2 subtree)
             (square subtree)))
       tree))

(define x (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(check-equal? (square-tree x) (list 1 (list 4 (list 9 16) 25) (list 36 49)))
(check-equal? (square-tree2 x) (list 1 (list 4 (list 9 16) 25) (list 36 49)))

