 
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

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))


(define (square x)
  (* x x))

(define x (list 1 2 3))
(check-equal? (accumulate + 0 x) 6)
(check-equal? (map square x) (list 1 4 9))
(define y (list 4 5 6))
(check-equal? (append x y) (list 1 2 3 4 5 6))
(check-equal? (length x) 3)