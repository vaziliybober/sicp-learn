 #lang sicp
(#%require rackunit)

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence)) 

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(check-equal? (reverse (list 1 2 3)) (list 3 2 1))
(check-equal? (reverse2 (list 1 2 3)) (list 3 2 1))

(accumulate append nil (list (list 1 2) (list 3 4)))