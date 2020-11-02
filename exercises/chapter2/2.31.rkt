 
 #lang sicp
(#%require rackunit)

(define (square x)
  (* x x))

(define (tree-map func tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map func subtree)
             (func subtree)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

(define x (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(check-equal? (square-tree x) (list 1 (list 4 (list 9 16) 25) (list 36 49)))

