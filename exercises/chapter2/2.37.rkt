 
 #lang sicp
(#%require rackunit)

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))

(define m (list (list 1 2)
                (list 3 4)))

(define v (list 1 2))

(check-equal? (matrix-*-vector m v) (list 5 11))
(check-equal? (transpose m) (list (list 1 3)
                                  (list 2 4)))
(check-equal? (matrix-*-matrix m (list (list 5 6)
                                       (list 7 8)))
              (list (list 19 22)
                    (list 43 50)))